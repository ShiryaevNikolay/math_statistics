import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field/input_field_listener.dart';

class InputField extends StatefulWidget {

  final String? hintText;
  final TextInputType? textInputType;
  final String? initText;
  final int? maxLines;
  InputFieldListener? inputFieldListener;
  _InputFieldState? _inputFieldState;

  String text = "";

  InputField({
    this.hintText,
    this.textInputType,
    this.initText,
    this.maxLines,
    this.inputFieldListener
  }) {
    text = initText ?? "";
  }

  @override
  _InputFieldState createState() => this._inputFieldState = _InputFieldState();

  void updateField(String text) {
    _inputFieldState?.updateField(text);
  }
}

class _InputFieldState extends State<InputField> {

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..text = widget.initText ??  ""
      ..addListener(() {
        widget.inputFieldListener?.listener(_controller?.text ?? "");
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
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
    controller: _controller,
  );

  void updateField(String text) {
    widget.text = text;
    setState(() {
      _controller?.text = text;
    });
  }
}