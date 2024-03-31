import 'dart:math';

import 'package:connections/widget/word.dart';
import 'package:flutter/material.dart';
import 'package:connections/widget/grid.dart';
import 'package:connections/widget/imageWidget.dart';
import 'package:google_fonts/google_fonts.dart';


class board extends StatefulWidget {
  const board ({Key? key}) : super(key: key);

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  List<String> words = [];
  List<WordSet> wordsets = [];
  int noOfMoves = 4;
  List<int> selectedWordIndices = [];
  String errorMsg = "";
  List<Set<String>> attemptedCombinations = [];

  @override
  void initState() {
    super.initState();
    initWords();
    words.shuffle();
  }

  List<String> initWords() {
    words = [];
    wordsets = WordSet.get4WordSets();
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
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            )
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: onSubmit,
                  child: Text("Submit"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: deselectAll,
                  child: Text("Deselect All"),
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
      if (noOfMoves == 0) {
        errorMsg = "Game over! These are the correct words";
        // show all the words with category in the grid
        selectedWordIndices.clear();
        words = [];
        for (WordSet wordSet in wordsets) {
          words.addAll(wordSet.word);
        }

        return;
      }

      if (selectedWordIndices.length != 4) {
        errorMsg = "Please select 4 words";
        return;
      }

      // Extract selected words from indices
      List<String> selectedWordsSet = selectedWordIndices.map((index) => words[index]).toList();

      if (attemptedCombinations.any((set) =>
          set.length == selectedWordsSet.length &&
          set.containsAll(selectedWordsSet))) {
        errorMsg = "This combination has already been tried!";
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
        String category = getCategory(selectedWordsSet[0]); // Assuming all selected words belong to the same category
        errorMsg = "Correct! Category: $category";
        // Remove correct words from the list
        words.removeWhere((element) => selectedWordsSet.contains(element));
        selectedWordIndices.clear();
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

  void newGame() {
    setState(() {
      noOfMoves = 4;
      selectedWordIndices.clear();
      attemptedCombinations.clear();
      errorMsg = "";
      words = initWords();
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
}