import 'package:flutter/widgets.dart';
import 'package:math_statistics/components/item_row_variations_data.dart';
import 'package:math_statistics/data/models/row_variation.dart';
import 'package:math_statistics/data/models/variations_data.dart';
import 'package:math_statistics/widgets/formulas/formulas.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DescriptiveStatisticsResultPage extends StatelessWidget {

  final VariationsData? variationsData;

  DescriptiveStatisticsResultPage({this.variationsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: Formulas.xAverage(context)),
          Text("${variationsData!.xAverage!.toStringAsFixed(3)}")
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          Expanded(child: Formulas.dispersion(context)),
          Text("${variationsData!.dispersion!.toStringAsFixed(3)}"),
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          if (variationsData!.rowsVariations!.first.interval!.max! - variationsData!.rowsVariations!.first.interval!.min! > 1)
            Expanded(child: Formulas.fashionInterval(context))
          else Expanded(child: Text("Мода: ")),
          Text("${variationsData!.fashion}"),
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          if (variationsData!.rowsVariations!.first.interval!.max! - variationsData!.rowsVariations!.first.interval!.min! > 1)
            Expanded(child: Formulas.medianInterval(context))
          else Expanded(child: Text("Мдиана: ")),
          Text("${variationsData!.median}"),
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          Expanded(child: Formulas.size(context)),
          Text("${variationsData!.size!.toStringAsFixed(3)}"),
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          Expanded(child: Formulas.coefficientVariation(context)),
          Text("${variationsData!.coefficientVariation!.toStringAsFixed(3)}"),
        ],),
        Expanded(
          child: ListView.builder(
              itemCount: variationsData!.rowsVariations!.length + 3,
              itemBuilder: (context, index) {
                if(index == 0) return ItemRowVariationsData();
                if(index > 0 && index <= variationsData!.rowsVariations!.length)
                  return ItemRowVariationsData(rowVariation: variationsData!.rowsVariations![index-1],);

                if(index == variationsData!.rowsVariations!.length + 1)
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

                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: "Импирическая функция распределения F(x)"),
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                series: <ChartSeries<RowVariation, num>>[
                  StepLineSeries(
                      dataSource: variationsData!.rowsVariations!,
                      xValueMapper: (RowVariation rowVariation, _) => rowVariation.interval!.min,
                      yValueMapper: (RowVariation rowVariation, _) => rowVariation.accumulatedFrequency
                  )
                ],
              );
              }
          ),
        ),
      ],
    );
  }
}