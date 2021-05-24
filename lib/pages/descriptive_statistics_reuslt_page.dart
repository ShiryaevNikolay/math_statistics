import 'package:flutter/widgets.dart';
import 'package:math_statistics/components/item_row_variations_data.dart';
import 'package:math_statistics/data/models/row_variation.dart';
import 'package:math_statistics/data/models/variations_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              itemCount: variationsData!.rowsVariations!.length + 2,
              itemBuilder: (context, index) {
                if(index == 0) return ItemRowVariationsData();
                if(index > 0 && index <= variationsData!.rowsVariations!.length)
                  return ItemRowVariationsData(rowVariation: variationsData!.rowsVariations![index-1],);

                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // title: ChartTitle(text: "Полигон"),
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  series: <ChartSeries<RowVariation, num>>[
                    ColumnSeries<RowVariation, num>(
                      dataSource: variationsData!.rowsVariations!,
                      xValueMapper: (RowVariation rowVariation, _) => rowVariation.interval!.min,
                      yValueMapper: (RowVariation rowVariation, _) => rowVariation.relativeFrequency,
                    ),
                    LineSeries<RowVariation, num>(
                        dataSource: variationsData!.rowsVariations!,
                        xValueMapper: (RowVariation rowVariation, _) => rowVariation.interval!.min,
                        yValueMapper: (RowVariation rowVariation, _) => rowVariation.relativeFrequency,

                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    ),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}