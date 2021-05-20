import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/components/counter.dart';
import 'package:math_statistics/widgets/check_box_widget/bloc_checkbox.dart';
import 'package:math_statistics/widgets/check_box_widget/check_box.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_state.dart';

class Parameter extends StatelessWidget {

  bool isCustomStep = false;

  @override
  Widget build(BuildContext context) => BlocBuilder<CheckboxBloc, CheckboxState>(
      builder: (context, state) {

        isCustomStep = (state as CheckboxValueState).isChecked;

        return Column(
          children: [
            CheckboxText(title: "Установить свой шаг",),
            if (state.isChecked) Counter(title: "Шаг интервала",)..minCounterValue = 1,
          ],
        );
      }
  );
}