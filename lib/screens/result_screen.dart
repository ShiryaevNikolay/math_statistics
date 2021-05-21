import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/data/models/variations_data.dart';
import 'package:math_statistics/pages/descriptive_statistics_reuslt_page.dart';

class ResultScreen extends StatelessWidget {

  final VariationsData? variationsData;

  ResultScreen({this.variationsData});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: statusBarHeight,),
              Expanded(child: DescriptiveStatisticsResultPage(
                variationsData: variationsData,
              )),
            ],
          ),
        ),
      ),
    );
  }
}