import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/components/counter.dart';
import 'package:math_statistics/widgets/check_box_widget/bloc_checkbox.dart';
import 'package:math_statistics/widgets/check_box_widget/check_box.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_state.dart';

class Parameter extends StatelessWidget {

  bool isCustomStep = false;
  Counter? counter;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CheckboxText(title: "Установить свой шаг",),
      BlocBuilder<CheckboxBloc, CheckboxState>(
        builder: (context, state) {
          isCustomStep = (state as CheckboxValueState).isChecked;

          return getFieldWidget(state.isChecked);
        },
      )
    ],
  );

  Widget getFieldWidget(bool isVisible) => Visibility(
    visible: isVisible,
    child: this.counter = Counter(title: "Шаг интервала",)..setMinCounterValue(1)
  );
}