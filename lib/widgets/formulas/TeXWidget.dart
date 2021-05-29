import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class TeXWidget extends TeXView {
  TeXWidget(
    BuildContext context,
    String data
  ) : super(
    child: TeXViewDocument(
      data,
      style: TeXViewStyle(textAlign: TeXViewTextAlign.Left)
    ),
    style: TeXViewStyle(
      textAlign: TeXViewTextAlign.Left,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    ),
  );
}