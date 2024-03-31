import 'package:connections/widget/word.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connections/widget/tile.dart';

class Grid extends StatelessWidget {
  final List<String> words;
  final List<int> isSelected;
  final Function(int) onTap;

  const Grid({
    required this.words,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return const SizedBox.shrink();
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double heightFactor = screenHeight >= 600 ? 0.6 : 0.9;
    double widthFactor = screenWidth >= 600 ? 0.3 : 0.9; 

   return Container(
      height: screenHeight * heightFactor,
      width: screenWidth * widthFactor,
      child: GridView.builder(
        itemCount: words.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Tile(
            word: words[index],
            isSelected: isSelected.contains(index),
            onTap: () {
              onTap(index);
            },
          );
        },
      ),
    );
  }
}