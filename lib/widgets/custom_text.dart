import 'package:flutter/material.dart';
import 'package:shoplustyle/utils/utils.dart';

import 'gradient_text.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDirection textDirection;
  final List<Color> colors;
  final TextDecoration textDecoration;

  CustomText(
      {this.text = "",
      this.color = Colors.black,
      this.fontFamily = 'IranSans',
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12.0,
      this.textDirection = TextDirection.rtl,
      this.colors,
      this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: colors == null ? color : null,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        decoration: textDecoration);

    return colors == null
        ? Text(
            Utils.persianDigits(text),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
            textDirection: textDirection,
          )
        : GradientText(
            text: Utils.persianDigits(text),
            colors: colors,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
            textDirection: textDirection,
            gradientDirection: GradientDirection.ttb,
          );
  }
}
