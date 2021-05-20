import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatefulWidget {

  InputField({
    this.hintText,
    this.textInputType,
    this.initText,
    this.maxLines,
    this.controller
  });

  final String? hintText;
  final TextInputType? textInputType;
  final String? initText;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  void initState() {
    super.initState();

    widget.controller?..text = widget.initText ??  "";
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    keyboardType: widget.textInputType,
    maxLines: widget.maxLines,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(int.parse("0xFFEBEDF0")),
        hintText: widget.hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        )
    ),
    controller: widget.controller,
  );
}