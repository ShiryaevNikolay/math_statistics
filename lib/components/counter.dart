import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field/input_field.dart';
import 'package:math_statistics/widgets/input_field/input_field_listener.dart';

class Counter extends StatelessWidget implements InputFieldListener {

  final String? title;
  num counter = 0;

  num? _minCounterValue;
  num? get minCounterValue => _minCounterValue;
  void setMinCounterValue(num? value) {
    if (value != null) {
      if (counter < value) {
        counter = value;
      }
    }
    _minCounterValue = value;
    updateField();
  }

  num? _maxCounterValue;
  num? get maxCounterValue => _maxCounterValue;
  void setMaxCounterValue(num? value) {
    if (value != null) {
      if (counter < value) {
        counter = value;
      }
    }
    _maxCounterValue = value;
    updateField();
  }

  InputField? _inputField;

  Counter({this.title}) {
    _inputField = InputField(
        maxLines: 1,
        initText: counter.toString(),
        inputFieldListener: this,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (title != null) Text(title!),
          if (title != null) const SizedBox(height: 8.0,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () { _decreaseCounter(); }
              ),
              IntrinsicWidth(child: _inputField),
              IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () { _increaseCounter(); }
              )
            ],
          ),
        ],
      ),
    );
  }

  void _decreaseCounter() {
    final minCounter = _minCounterValue;
    if (minCounter == null) {
      counter--;
    } else {
      if (counter > minCounter) {
        counter--;
      }
    }
    updateField();
  }

  void _increaseCounter() {
    final maxCounter = _maxCounterValue;
    if (maxCounter == null) {
      counter++;
    } else {
      if (counter > maxCounter) {
        counter++;
      }
    }
    updateField();
  }

  void updateField() {
    _inputField?.updateField(counter.toString());
  }

  @override
  void listener(String text) {
    counter = int.parse(text);
  }
}