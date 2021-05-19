import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatelessWidget {

  InputField({this.hintText});

  String? hintText;

  @override
  Widget build(BuildContext context) => TextField(
    keyboardType: TextInputType.number,
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