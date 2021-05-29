import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field/input_field.dart';
import 'package:math_statistics/widgets/input_field/input_field_listener.dart';

class PointEstimatePage extends StatelessWidget implements InputFieldListener {

  String sample = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Y: "),
            Expanded(
              child: InputField(
                hintText: "Вероятность",
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  void listener(String text) {
    sample = text;
  }
}