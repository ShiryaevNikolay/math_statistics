import 'package:flutter/widgets.dart';
import 'package:math_statistics/data/models/variations_data.dart';

class DescriptiveStatisticsResultPage extends StatelessWidget {

  final VariationsData? variationsData;

  DescriptiveStatisticsResultPage({this.variationsData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$variationsData"),
    );
  }
}