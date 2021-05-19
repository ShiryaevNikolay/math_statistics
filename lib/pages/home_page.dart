import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/input_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: statusBarHeight,),
                Expanded(
                  child: SingleChildScrollView(
                    child: InputField(
                        hintText: "Выборка"
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
            ),
          )
      ),
    );
  }
}