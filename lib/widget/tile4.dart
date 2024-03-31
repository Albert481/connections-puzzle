import 'package:flutter/material.dart';

class Tile4 extends StatelessWidget {
  final String categoryTitle;
  final List<String> words;
  final int difficulty;

  const Tile4({
    required this.categoryTitle,
    required this.words,
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size should be same as the grid size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double heightFactor = screenHeight >= 600 ? 0.6 : 0.9;
    double widthFactor = screenWidth >= 600 ? 0.3 : 0.9;

    // if there are empty rows, return an empty SizedBox
    if (categoryTitle.isEmpty) {
      return const SizedBox.shrink();
    }

    Color backgroundColor;
    switch (difficulty) {
      case 1:
        backgroundColor = Colors.yellow;
        break;
      case 2:
        backgroundColor = Colors.green; 
        break;
      case 3:
        backgroundColor = Colors.lightBlue;
        break;
      default:
        backgroundColor = Colors.purple;
    }

    // return a card with the category title and the words
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: screenHeight * heightFactor * 0.1,
        width: screenWidth * widthFactor,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // display the category title on the first line and the words on the second line
            Text(
              categoryTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              words.join(", "),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}