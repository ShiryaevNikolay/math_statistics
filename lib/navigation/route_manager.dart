import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_statistics/screens/home_screen.dart';
import 'package:math_statistics/screens/result_screen.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // Главный экран
      case '/':
        return getRouteFor(
          HomeScreen()
        );

      case '/result':
        return getRouteFor(
            ResultScreen()
        );

      default:
        return _underConstructionRoute();
    }
  }

  static Route<dynamic> getRouteFor(Widget widget) => Platform.isIOS
      ? CupertinoPageRoute(builder: (_) => widget)
      : MaterialPageRoute(builder: (_) => widget);

  static Route<dynamic> _underConstructionRoute() => getRouteFor(
    Scaffold(
      body: Center(
        child: Text("Under Construction"),
      ),
    )
  );
}