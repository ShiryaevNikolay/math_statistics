import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field.dart';

class Counter extends StatefulWidget {

  Counter({this.title});

  final _counterState = _CounterState();

  final String? title;
  num counter = 0;

  num? _minCounterValue;
  num? get minCounterValue => _minCounterValue;
  set minCounterValue(num? value) {
    if (value != null) {
      if (counter < value) {
        counter = value;
      }
    }
    _minCounterValue = value;
    _counterState.updateField();
  }

  num? _maxCounterValue;
  num? get maxCounterValue => _maxCounterValue;
  set maxCounterValue(num? value) {
    if (value != null) {
      if (counter < value) {
        counter = value;
      }
    }
    _maxCounterValue = value;
    _counterState.updateField();
  }

  @override
  _CounterState createState() => _counterState;
}

class _CounterState extends State<Counter> {

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        widget.counter = int.parse(_controller?.text ?? "0");
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (widget.title != null) Text(widget.title!),
          if (widget.title != null) const SizedBox(height: 8.0,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    setState(() {
                      _decreaseCounter();
                    });
                  }
              ),
              IntrinsicWidth(child: InputField(
                maxLines: 1,
                initText: widget.counter.toString(),
                controller: _controller,
              )),
              IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    setState(() {
                      _increaseCounter();
                    });
                  }
              )
            ],
          ),
        ],
      ),
    );
  }

  void _decreaseCounter() {
    final minCounter = widget._minCounterValue;
    if (minCounter == null) {
      widget.counter--;
    } else {
      if (widget.counter > minCounter) {
        widget.counter--;
      }
    }
    updateField();
  }

  void _increaseCounter() {
    final maxCounter = widget._maxCounterValue;
    if (maxCounter == null) {
      widget.counter++;
    } else {
      if (widget.counter > maxCounter) {
        widget.counter++;
      }
    }
    updateField();
  }

  void updateField() {
    _controller?.text = widget.counter.toString();
  }
}