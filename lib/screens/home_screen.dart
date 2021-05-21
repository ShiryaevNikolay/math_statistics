import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/pages/descriptive_statistics_page.dart';

class HomeScreen extends StatelessWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: statusBarHeight,),
                Expanded(child: DescriptiveStatisticsPage(
                  scaffoldKey: _scaffoldKey,
                )),
              ],
            ),
          )
      ),
    );
  }
}