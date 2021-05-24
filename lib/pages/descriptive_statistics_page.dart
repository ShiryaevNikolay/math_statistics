import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/components/parameter.dart';
import 'package:math_statistics/data/generate_data.dart';
import 'package:math_statistics/data/models/variations_data.dart';
import 'package:math_statistics/widgets/check_box_widget/bloc_checkbox.dart';
import 'package:math_statistics/widgets/input_field/input_field.dart';
import 'package:math_statistics/widgets/input_field/input_field_listener.dart';

class DescriptiveStatisticsPage extends StatelessWidget implements InputFieldListener {

  String sample = "";

  Parameter customStep = Parameter();
  late final GlobalKey<ScaffoldState>? scaffoldKey;

  DescriptiveStatisticsPage({this.scaffoldKey});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<CheckboxBloc>(create: (_) => CheckboxBloc())
    ],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        customStep,
        Expanded(
          child: SingleChildScrollView(
            child: InputField(
                hintText: "Выборка",
                textInputType: TextInputType.number,
                inputFieldListener: this,
            ),
          ),
        ),
        MaterialButton(
            child: Text("Вычислить"),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Theme.of(context).accentColor,
            onPressed: () {
              List<num> samples = sample.isNotEmpty
                  ? (sample.split(' ').map((e) => num.parse(e)).toList())
                  : List.empty();

              if (samples.isNotEmpty) {
                num startInterval = samples.reduce(min);
                num stepIntervalInput = customStep.counter?.counter ?? 1;
                GenerateData data = GenerateData(
                  samples: samples,
                  customStep: customStep.isCustomStep,
                  startInterval: startInterval,
                  stepIntervalInput: stepIntervalInput
                );
                navigateToResultScreen(context, data.variationsData!);
              } else {
                showSnackbar();
              }
            }
        )
      ],
    ),
  );

  void navigateToResultScreen(BuildContext context, VariationsData variationsData) {
    Navigator.pushNamed(context, '/result',
        arguments: {
          'variationData': variationsData
        }
    );
  }

  void showSnackbar() {
    scaffoldKey?.currentState!.hideCurrentSnackBar();
    scaffoldKey?.currentState!.showSnackBar(SnackBar(content: Text("Выборка не удовлетворяет условию")));
  }

  @override
  void listener(String text) {
    sample = text;
  }
}