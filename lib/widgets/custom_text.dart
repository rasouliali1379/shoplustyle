import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDirection textDirection;

  CustomText(
      {this.text = "",
      this.fontFamily = 'IranSans',
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12.0,
      this.textDirection = TextDirection.rtl});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight),
      textDirection: textDirection,
    );
  }
}
