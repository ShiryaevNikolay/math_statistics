import 'package:flutter/widgets.dart';
import 'package:math_statistics/components/item_row_variations_data.dart';
import 'package:math_statistics/data/models/variations_data.dart';

class DescriptiveStatisticsResultPage extends StatelessWidget {

  final VariationsData? variationsData;

  DescriptiveStatisticsResultPage({this.variationsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Среднее выборочное: ${variationsData!.xAverage!.toStringAsFixed(3)}"),
        Text("Выборочная дисперсия: ${variationsData!.dispersion!.toStringAsFixed(3)}"),
        Text("Мода: ${variationsData!.fashion}"),
        Text("Медиана: ${variationsData!.median}"),
        Text("Размах: ${variationsData!.size!.toStringAsFixed(3)}"),
        Text("Коэф. вариации: ${variationsData!.coefficientVariation!.toStringAsFixed(3)}"),
        Expanded(
          child: ListView.builder(
              itemCount: variationsData!.rowsVariations!.length + 1,
              itemBuilder: (context, index) => index == 0
                  ? ItemRowVariationsData()
                  : ItemRowVariationsData(rowVariation: variationsData!.rowsVariations![index-1],)
          ),
        )
      ],
    );
  }
}