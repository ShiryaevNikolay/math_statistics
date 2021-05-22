import 'package:flutter/widgets.dart';
import 'package:math_statistics/data/models/row_variation.dart';

class ItemRowVariationsData extends StatelessWidget {

  final RowVariation? rowVariation;

  ItemRowVariationsData({this.rowVariation});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
          child: Center(
              child: Text(rowVariation != null
                  ? (rowVariation!.interval!.max! - rowVariation!.interval!.min! == 1)
                    ? rowVariation!.interval!.min!.toStringAsFixed(3)
                    : "${rowVariation!.interval!.min!.toStringAsFixed(3)}-${rowVariation!.interval!.max!.toStringAsFixed(3)}"
                  : "X"
              )
          )
      ),
      Container(
        width: 2,
      ),
      Expanded(
          child: Center(child: Text(rowVariation != null ? rowVariation!.frequency!.toStringAsFixed(3) : "Ni"))
      ),
      Container(
        width: 2,
      ),
      Expanded(
          child: Center(child: Text(rowVariation != null ? rowVariation!.relativeFrequency!.toStringAsFixed(3) : "Ni/N"))
      ),
      Container(
        width: 2,
      ),
      Expanded(
          child: Center(child: Text(rowVariation != null ? rowVariation!.accumulatedFrequency!.toStringAsFixed(3) : "Накопленная частность"))
      ),
    ],
  );
}