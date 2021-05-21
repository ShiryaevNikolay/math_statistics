class RowVariation {
  Interval? interval;
  num? frequency;
  num? relativeFrequency;
  num? accumulatedFrequency;

  RowVariation({
    this.interval,
    this.frequency,
    this.relativeFrequency,
    this.accumulatedFrequency
  });
}

class Interval {
  num? min;
  num? max;

  Interval({
    this.min,
    this.max
  });
}