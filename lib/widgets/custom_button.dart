import 'package:flutter/material.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight textWeight;
  final ShapeBorder shape;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final EdgeInsetsGeometry margin;
  final borderRadius;

  CustomButton(
      {this.text = "",
      this.textSize = 12,
      this.textColor = Colors.white,
      this.textWeight = FontWeight.normal,
      this.shape,
      this.gradientColors,
      this.borderRadius,
      this.margin,
      this.onPressed});

  final defaultBorderRadius = BorderRadius.all(Radius.circular(20.0));
  final defaultGradientColors = [PRIMARY_LIGHT, PRIMARY_DARK];
  final EdgeInsetsGeometry defaultMargin = EdgeInsets.all(12);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0.0),
      color: Colors.white,
      child: Container(
        margin: margin ?? defaultMargin,
        child: CustomText(
            text: text,
            fontSize: textSize,
            color: PRIMARY_LIGHT,
            fontWeight: textWeight),
      ),
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: borderRadius ?? defaultBorderRadius,
              side: BorderSide(
                color: PRIMARY_LIGHT,
                width: 2,
              )),
    );
  }
}
