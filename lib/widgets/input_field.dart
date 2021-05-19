import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatelessWidget {

  InputField({
    this.hintText,
    this.textInputType
  });

  String? hintText;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) => TextField(
    keyboardType: textInputType,
    maxLines: null,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(int.parse("0xFFEBEDF0")),
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)
      )
    ),
  );
}