import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/pages/descriptive_statistics_page.dart';
import 'package:math_statistics/pages/point_estimate_page.dart';

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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          body: Column(
            children: [
              SizedBox(height: statusBarHeight,),
              TabBar(
                labelColor: Theme.of(context).accentColor,
                tabs: [
                  Tab(text: "Описательная статистика",),
                  Tab(text: "Точечная оценка параметров",)
                ]
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DescriptiveStatisticsPage(
                        scaffoldKey: _scaffoldKey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PointEstimatePage(),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}