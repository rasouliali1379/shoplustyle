import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoplustyle/utils/consts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType textInputType;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;


  CustomTextField({this.hint, this.textInputType, this.controller,this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
        textAlign: TextAlign.center,
        maxLines: 1,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.number,
        controller: controller,
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
