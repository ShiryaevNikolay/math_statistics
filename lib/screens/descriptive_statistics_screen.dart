import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field.dart';

class DescriptiveStatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      CheckboxListTile(
        title: Text("Установить свой шаг интервала"),
        controlAffinity: ListTileControlAffinity.leading,
        value: false,
        onChanged: (value) {}
      ),
      Expanded(
        child: SingleChildScrollView(
          child: InputField(
            hintText: "Выборка",
            textInputType: TextInputType.number,
          ),
        ),
      ),
      MaterialButton(
          child: Text("Вычислить"),
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).accentColor,
          onPressed: () {}
      )
    ],
  );
}