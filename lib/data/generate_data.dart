import 'dart:math';

import 'package:math_statistics/data/models/row_variation.dart';
import 'package:math_statistics/data/models/variations_data.dart';

class GenerateData {
  List<num>? samples = List.empty();
  bool customStep = false;
  num? startInterval;
  num? stepIntervalInput;

  VariationsData? variationsData;

  GenerateData({
    this.samples,
    this.customStep = false,
    this.startInterval,
    this.stepIntervalInput
  }) {
    int countIntervals = (1 + 3.322*log(samples!.length)).toInt();
    num? stepInterval = customStep ? stepIntervalInput : ((samples!.reduce(max) - samples!.reduce(min)) / countIntervals).ceil();

    num a = startInterval ?? 0;
    num b = a + (stepInterval ?? 1);

    List<RowVariation> listRowsVariations = [];

    num xAverage = 0.0;
    num accumFrequency = 0.0;

    while (a <= samples!.reduce(max)) {
      Interval interval = Interval(min: a, max: b);

      num frequency = 0.0;
      samples!.forEach((element) {
        if (element >= interval.min! && element < interval.max!) frequency++;
      });
      num relativeFrequency = frequency / samples!.length;
      accumFrequency += relativeFrequency;

      num xi = stepInterval != 1
          ? (interval.max! - interval.min!) / 2
          : interval.min!;

      xAverage += xi * relativeFrequency;

      a = b;
      b += stepInterval!;

      listRowsVariations.add(RowVariation(
        interval: interval,
        frequency: frequency,
        relativeFrequency: relativeFrequency,
        accumulatedFrequency: accumFrequency
      ));
    }

    num dispersion = 0.0;
    num fashion = 0.0;
    num median = 0.0;

    listRowsVariations.forEach((element) {
      num midpointInterval = stepInterval != 1
          ? (element.interval!.max! + element.interval!.min! - 1) / 2
          : element.interval!.min!;

      dispersion += pow(midpointInterval - xAverage, 2) * element.relativeFrequency!;
    });

    RowVariation maxFrequency = listRowsVariations.reduce((current, next) => current.frequency! > next.frequency!
        ? current
        : next
    );
    if (stepInterval != 1) {
      num indexHighestFrequency = listRowsVariations.indexWhere((element) => element.accumulatedFrequency! > 0.5 ? true : false);
      num maxIntervalFrequency = listRowsVariations.indexWhere((element) => element == maxFrequency ? true : false);
      fashion = _calculateFashionInterval(listRowsVariations, maxIntervalFrequency, stepInterval!);
      median = _calculateMedianInterval(listRowsVariations, indexHighestFrequency, stepInterval);
    } else {
      fashion = _calculateFashion(maxFrequency);
      median = _calculateMedian(listRowsVariations, listRowsVariations.length);
    }

    dispersion = dispersion * samples!.length / (samples!.length - 1);

    num coefficientVariation = sqrt(dispersion) / xAverage * 100;
    num size = samples!.reduce(max) - samples!.reduce(min) + 1;

    variationsData = VariationsData(
      xAverage: xAverage,
      dispersion: dispersion,
      fashion: fashion,
      median: median,
      size: size,
      coefficientVariation: coefficientVariation,
      rowsVariations: listRowsVariations
    );
  }

  num _calculateFashionInterval(List<RowVariation> listRowsVariations, num maxIntervalFrequency, num stepInterval) =>
      listRowsVariations[maxIntervalFrequency.toInt()].interval!.min! + stepInterval *
          (listRowsVariations[maxIntervalFrequency.toInt()].frequency! - listRowsVariations[maxIntervalFrequency.toInt() - 1].frequency!) /
          ((listRowsVariations[maxIntervalFrequency.toInt()].frequency! - listRowsVariations[maxIntervalFrequency.toInt() - 1].frequency!) *
              (listRowsVariations[maxIntervalFrequency.toInt()].frequency! - listRowsVariations[maxIntervalFrequency.toInt() + 1].frequency!));

  num _calculateFashion(RowVariation maxFrequency) => maxFrequency.interval!.min!;

  num _calculateMedianInterval(List<RowVariation> listRowsVariations, num indexHighestFrequency, num stepInterval) {
    num sumFrequency = 0.0;
    listRowsVariations.forEach((element) {
      if (listRowsVariations.indexOf(element) < indexHighestFrequency) {
        sumFrequency += element.frequency!;
      }
    });
    return listRowsVariations[indexHighestFrequency.toInt()].interval!.min! + stepInterval *
        ((0.5 * samples!.length - sumFrequency) / listRowsVariations[indexHighestFrequency.toInt()].frequency!);
  }

  num _calculateMedian(List<RowVariation> listRowsVariations, num countInterval) => countInterval % 2 != 0
      ? listRowsVariations[(countInterval ~/ 2) + 1].interval!.min!
      : (listRowsVariations[(countInterval ~/ 2) + 1].interval!.min! + listRowsVariations[countInterval ~/ 2].interval!.min!) ~/ 2;
}