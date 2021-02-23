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
  final int maxLines;
  final double height;
  final TextAlign textAlign;

  CustomText(
      {this.text = "",
      this.color = Colors.black,
      this.fontFamily = 'IranSans',
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12.0,
      this.textDirection = TextDirection.rtl,
      this.colors,
      this.maxLines = 1,
        this.height,
      this.textDecoration = TextDecoration.none,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: colors == null ? color : null,
        height: height != null? height : null,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        decoration: textDecoration);

    return colors == null
        ? Text(
            Utils.toPersianDigits(text),

            maxLines: maxLines == -1 ? null : maxLines,
            overflow: maxLines == -1 ? null : TextOverflow.ellipsis,
            textAlign: textAlign != null ? textAlign : null,
            style: textStyle,
            textDirection: textDirection,
          )
        : GradientText(
            text: Utils.toPersianDigits(text),
            colors: colors,
            maxLines: maxLines == -1 ? null : maxLines,
            overflow: maxLines == -1 ? null : TextOverflow.ellipsis,
            textAlign: textAlign != null ? textAlign : null,
            style: textStyle,
            textDirection: textDirection,
            gradientDirection: GradientDirection.ttb,
          );
  }
}
