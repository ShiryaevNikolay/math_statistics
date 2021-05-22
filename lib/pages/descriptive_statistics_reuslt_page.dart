import 'package:flutter/widgets.dart';
import 'package:math_statistics/components/item_row_variations_data.dart';
import 'package:math_statistics/data/models/variations_data.dart';

class DescriptiveStatisticsResultPage extends StatelessWidget {

  final VariationsData? variationsData;

  DescriptiveStatisticsResultPage({this.variationsData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: variationsData!.rowsVariations!.length + 1,
      itemBuilder: (context, index) => index == 0
          ? ItemRowVariationsData()
          : ItemRowVariationsData(rowVariation: variationsData!.rowsVariations![index-1],)
    );
  }
}