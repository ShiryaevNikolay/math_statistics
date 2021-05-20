import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field.dart';

class Counter extends StatefulWidget {

  Counter({this.title});

  final String? title;
  num counter = 0;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        widget.counter = _controller?.text as num;
      });
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
                      widget.counter--;
                      _updateField(widget.counter.toString());
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
                      widget.counter++;
                      _updateField(widget.counter.toString());
                    });
                  }
              )
            ],
          ),
        ],
      ),
    );
  }

  void _updateField(String text) {
    _controller?.text = text;
  }
}