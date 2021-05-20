import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/components/counter.dart';
import 'package:math_statistics/components/parameter.dart';
import 'package:math_statistics/widgets/check_box_widget/bloc_checkbox.dart';
import 'package:math_statistics/widgets/check_box_widget/check_box.dart';
import 'package:math_statistics/widgets/input_field.dart';

class DescriptiveStatisticsScreen extends StatelessWidget {

  final Parameter customStep = Parameter();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<CheckboxBloc>(create: (_) => CheckboxBloc())
    ],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        customStep,
        Expanded(
          child: SingleChildScrollView(
            child: InputField(
              hintText: "Выборка",
              textInputType: TextInputType.number,
            ),
          ),
        ),
        MaterialButton(
            child: Text("Вычислить"),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Theme.of(context).accentColor,
            onPressed: () {}
        )
      ],
    ),
  );
}

// class _DescriptiveStatisticsScreenState extends State<DescriptiveStatisticsScreen> {
//   late Counter counter;
//
//   late CheckboxText checkboxText;
//
//   @override
//   void initState() {
//     super.initState();
//
//     counter = Counter(title: "Шаг интервала",)..minCounterValue = 1;
//
//     checkboxText = CheckboxText(title: "Установить свой шаг", callback: (bool value) { setState(() {
//       widget.customStep = value; });
//     },);
//   }
//
//   @override
//   Widget build(BuildContext context) => Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       checkboxText,
//       if (widget.customStep) counter,
//       Expanded(
//         child: SingleChildScrollView(
//           child: InputField(
//             hintText: "Выборка",
//             textInputType: TextInputType.number,
//           ),
//         ),
//       ),
//       MaterialButton(
//           child: Text("Вычислить"),
//           minWidth: double.infinity,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           color: Theme.of(context).accentColor,
//           onPressed: () {}
//       )
//     ],
//   );
// }