import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_statistics/widgets/formulas/TeXWidget.dart';

class Formulas {
  static Widget xAverage(BuildContext context, {int n = 1}) => TeXWidget(
      context,
      r"""\)
      \bar{x} = {1 \over n} \sum_{i=1}^n x_i n_i =
      \)"""
  );

  static Widget dispersion(BuildContext context) => TeXWidget(
      context,
      r"""\)
      S^2_{исп} = {1 \over {n-1}} \sum_{i=1}^n {(x_i - \bar{x})}^2 n_i =
      \)"""
  );

  static Widget fashionInterval(BuildContext context) => TeXWidget(
      context,
      r"""\)
      x_0 + k \frac{n_i - n_{i-1}}{(n_i - n_{i-1})(n_i - n_{i+1})} =
      \)"""
  );

  static Widget medianInterval(BuildContext context) => TeXWidget(
      context,
      r"""\)
      x_0 + k \frac{\frac{n}{2} - T_{i-1}}{n_i} =
      \)"""
  );

  static Widget size(BuildContext context) => TeXWidget(
      context,
      r"""\)
      Размах = x_{max} - x_{min} + 1 =
      \)"""
  );

  static Widget coefficientVariation(BuildContext context) => TeXWidget(
      context,
      r"""\(
      V = \frac{S_{исп}}{\bar{x}} 100 \% =
      \)"""
  );

  static Widget intervalMathWithDispersion(BuildContext context) => TeXWidget(
      context,
      r"""\(
      \varepsilon = U_{\frac{1+\gamma}{2}} \frac{\sigma}{\sqrt{n}}
      \)"""
  );

  static Widget statisticsMathWithoutDispersion(BuildContext context) => TeXWidget(
      context,
      r"""\(
      T = \frac{(\bar{x} - \mu) \sqrt{n}}{S_{исп}} =
      \)"""
  );

  static Widget intervalMathWithoutDispersion(BuildContext context) => TeXWidget(
      context,
      r"""\(
      \varepsilon = t_{(\frac{1+\gamma}{2})(n-1)} \frac{S_{исп}}{\sqrt{n}}
      \)"""
  );

  static Widget statisticsDispersionWithoutMath(BuildContext context) => TeXWidget(
      context,
      r"""\(
      T = \frac{S^2_{исп} (n - 1)}{\theta} =
      \)"""
  );

  static Widget intervalDispersionWithoutMath(BuildContext context) => TeXWidget(
      context,
      r"""\(
      \bar{\underline{\theta}} = \frac{S^2_{исп} (n - 1)}{\chi^2_{(\frac{1 \pm \gamma}{2})(n-1)}}
      \)"""
  );
}