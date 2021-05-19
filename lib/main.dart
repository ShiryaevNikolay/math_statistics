import 'package:flutter/material.dart';
import 'package:math_statistics/navigation/route_manager.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteManager.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  )
);
