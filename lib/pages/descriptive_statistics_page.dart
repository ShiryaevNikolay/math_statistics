import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/components/parameter.dart';
import 'package:math_statistics/data/generate_data.dart';
import 'package:math_statistics/data/models/variations_data.dart';
import 'package:math_statistics/widgets/check_box_widget/bloc_checkbox.dart';
import 'package:math_statistics/widgets/input_field.dart';

class DescriptiveStatisticsPage extends StatefulWidget {

  late final GlobalKey<ScaffoldState>? scaffoldKey;

  DescriptiveStatisticsPage({this.scaffoldKey});

  @override
  _DescriptiveStatisticsPageState createState() => _DescriptiveStatisticsPageState();
}

class _DescriptiveStatisticsPageState extends State<DescriptiveStatisticsPage> {
  final Parameter customStep = Parameter();
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
              controller: _controller,
            ),
          ),
        ),
        MaterialButton(
            child: Text("Вычислить"),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Theme.of(context).accentColor,
            onPressed: () {
              List<num> samples = _controller?.text != null
                  ? (_controller?.text.split(' ').map((e) => num.parse(e)).toList() ?? List.empty())
                  : List.empty();

              if (samples.isNotEmpty) {
                num startInterval = samples.reduce(min);
                num stepIntervalInput = customStep.counter.counter;
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
    widget.scaffoldKey?.currentState!.hideCurrentSnackBar();
    widget.scaffoldKey?.currentState!.showSnackBar(SnackBar(content: Text("Выборка не удовлетворяет условию")));
  }
}