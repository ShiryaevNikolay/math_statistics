import 'package:math_statistics/data/models/row_variation.dart';

class VariationsData {
  num? xAverage;
  num? dispersion;
  num? fashion;
  num? median;
  num? size;
  num? coefficientVariation;
  List<RowVariation>? rowsVariations;

  VariationsData({
    this.xAverage,
    this.dispersion,
    this.fashion,
    this.median,
    this.size,
    this.coefficientVariation,
    this.rowsVariations
  });
}