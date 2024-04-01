import 'dart:math';

import 'package:connections/widget/tile4.dart';
import 'package:connections/widget/word.dart';
import 'package:flutter/material.dart';
import 'package:connections/widget/grid.dart';
import 'package:connections/widget/tile4.dart';
import 'package:connections/widget/imageWidget.dart';
import 'package:google_fonts/google_fonts.dart';


class board extends StatefulWidget {
  const board ({Key? key}) : super(key: key);

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  bool isGameOver = false;
  List<String> words = [];
  List<WordSet> wordsets = [];
  List<WordSet> correctWordSets = [];
  int noOfMoves = 4;
  List<int> selectedWordIndices = [];
  String errorMsg = "";
  List<Set<String>> attemptedCombinations = [];

  @override
  void initState() {
    super.initState();
    initWords();
    words.shuffle();
    isGameOver = false;
  }

  List<String> initWords() {
    words = [];
    wordsets = WordSet.get4WordSets();

    // Ensure that there are exactly 4 unique category titles
    Set<String> uniqueCategories = wordsets.map((e) => e.categoryTitle).toSet();
    while (uniqueCategories.length != 4) {
      wordsets = WordSet.get4WordSets();
      uniqueCategories = wordsets.map((e) => e.categoryTitle).toSet();
    }

    // Add words from each WordSet to the words list
    for (WordSet wordSet in wordsets) {
      words.addAll(wordSet.word);
    }

    return words;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Connections Puzzle",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          // add help icon which will show a modal with help text
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('HOW TO PLAY'),
                    content: Text('''
Find groups of four items that share something in common.

Select four items and tap 'Submit' to check if your guess is correct.

Find the groups without making 4 mistakes!

Category Examples
FISH: Bass, Flounder, Salmon, Trout
FIRE ___: Ant, Drill, Island, Opal

Categories will always be more specific than "5-LETTER-WORDS," "NAMES" or "VERBS."

Each puzzle has exactly one solution. Watch out for words that seem to belong to multiple categories!

Each group is assigned a color, which will be revealed as you solve:
From Easy to Hard: Yellow, Green, Blue, Purple
                    '''),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    for (WordSet wordSet in correctWordSets)
                      Tile4(
                        categoryTitle: wordSet.categoryTitle,
                        words: wordSet.word,
                        difficulty: wordSet.difficulty,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: 
              Grid(
                  words: words,
                  isSelected: selectedWordIndices,
                  onTap: onClick
              )
          ),
          Center(
              child: Text(
            errorMsg == "" ? "" : errorMsg,
            style: GoogleFonts.roboto(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          Center(
           child: isGameOver
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: playAgain,
            child: Text("Play Again"),
          )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: selectedWordIndices.length == 4
                      ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: onSubmit,
                        child: Text("Submit"),
                      )
                      : ElevatedButton(onPressed: null, child: Text("Submit")),
                )
                ,
                SizedBox(width: 16),
                Center(
                  child: selectedWordIndices.isNotEmpty
                      ? ElevatedButton(
                          onPressed: deselectAll,
                          child: Text("Deselect All"),
                        )
                      : ElevatedButton(onPressed: null, child: Text("Deselect All")
                      ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onShuffle,
                  child: Text("Shuffle"),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
              child: Text(
            noOfMoves.toString() + " moves left.",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }

  void onClick(int index) {
    setState(() {

      if (selectedWordIndices.contains(index)) {
        selectedWordIndices.remove(index);
      } else {
        if (selectedWordIndices.length < 4) {
          selectedWordIndices.add(index);
        } else {
          return;
        }
      }
    });
  }

  void onSubmit() {
    setState(() {
      if (words.isEmpty) {
        gameOver();
      }

      if (noOfMoves <= 1) {
        gameOver();
        errorMsg = "Game over! These are the correct words";
        noOfMoves = 0;
        selectedWordIndices.clear();
        words = [];
        for (WordSet wordSet in wordsets) {
          words.addAll(wordSet.word);
        }

        return;
      }

      // Extract selected words from indices
      List<String> selectedWordsSet = selectedWordIndices.map((index) => words[index]).toList();

      if (attemptedCombinations.any((set) =>
          set.length == selectedWordsSet.length &&
          set.containsAll(selectedWordsSet))) {
        errorMsg = "You have already attempted this combination!";
        return;
      }

      // Check for correctness
      int maxCount = 0;
      for (WordSet wordSet in wordsets) { // Iterate over wordsets instead of words
        int count = 0;
        for (String word in wordSet.word) {
          if (selectedWordsSet.contains(word)) {
            count++;
          }
        }
        maxCount = max(maxCount, count);
      }

      if (maxCount == 4) {
        String category = getCategory(selectedWordsSet[0]);
        errorMsg = "Correct! Category: $category";
        words.removeWhere((element) => selectedWordsSet.contains(element));
        correctWordSets.add(wordsets.firstWhere((element) => element.word.contains(selectedWordsSet[0])));
        selectedWordIndices.clear();
        if (words.isEmpty) {
          gameOver();
        }
      } else {
        errorMsg = maxCount == 3 ? "One word away!" : "Incorrect";
        attemptedCombinations.add(Set.from(selectedWordsSet));
        noOfMoves--;
      }
    });
  }

  void deselectAll() {
    setState(() {
      selectedWordIndices.clear();
    });
  }

  void playAgain() {
    setState(() {
      isGameOver = false;
      noOfMoves = 4;
      correctWordSets.clear();
      selectedWordIndices.clear();
      attemptedCombinations.clear();
      errorMsg = "";
      words = initWords();
      words.shuffle();
    });
  }

  void onShuffle() {
    setState(() {
      // Save the selected words
      List<String> selectedWordsSet = selectedWordIndices.map((index) => words[index]).toList();
      
      // Clear the selected word indices
      selectedWordIndices.clear();
      
      // Shuffle the words list
      words.shuffle();
      
      // Restore the selected words indices
      for (String word in selectedWordsSet) {
        int index = words.indexOf(word);
        if (index != -1) {
          selectedWordIndices.add(index);
        }
      }
      
      errorMsg = "";
    });
  }

  String getCategory(String word) {
    for (WordSet wordSet in wordsets) {
      if (wordSet.word.contains(word)) {
        return wordSet.categoryTitle;
      }
    }
    return "";
  }

  void gameOver() {
    setState(() {
      isGameOver = true;
      selectedWordIndices.clear();
      words = [];
    });
  }
}