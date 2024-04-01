import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String word;
  final bool isSelected;
  final Function onTap;

  const Tile({
    required this.word,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 10,
        color: isSelected ? Colors.brown[900] : Colors.brown[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                word,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}