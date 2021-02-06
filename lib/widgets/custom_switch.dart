import 'package:flutter/material.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch(this.value, this.text, this.onChanged);

  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text, fontSize: 14),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: PRIMARY_LIGHT,
          activeColor: PRIMARY_DARK,
        ),
      ],
    );
  }
}
