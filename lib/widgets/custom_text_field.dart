import 'package:flutter/material.dart';
import 'package:shoplustyle/utils/consts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType textInputType;


  CustomTextField(this.hint, this.textInputType);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        maxLines: 1,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontFamily: 'iransans',
        ),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.only(right: 16, left: 16),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: PRIMARY_LIGHT),
              borderRadius: const BorderRadius.all(const Radius.circular(20))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(20))),
        ));
  }
}
