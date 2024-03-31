import 'package:flutter/material.dart';

class imageDisplay extends StatelessWidget {
  String imagePath;
  imageDisplay(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
      )),
    );
  }
}