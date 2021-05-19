import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_statistics/pages/home_page.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // Главный экран
      case '/':
        return getRouteFor(
          HomePage()
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