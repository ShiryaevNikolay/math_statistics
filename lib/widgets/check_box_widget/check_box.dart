import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_event.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_state.dart';
import 'bloc_checkbox.dart';

class CheckboxText extends StatelessWidget {

  CheckboxText({this.title});

  final String? title;
  late final CheckboxBloc _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<CheckboxBloc>(context);

    return BlocBuilder<CheckboxBloc, CheckboxState>(
      builder: (context, state) {
        return CheckboxListTile(
            title: title != null ? Text(title!) : null,
            controlAffinity: ListTileControlAffinity.leading,
            value: (state as CheckboxValueState).isChecked,
            onChanged: (value) {
              _bloc.add(CheckboxChangeValue.changeValueTo(!state.isChecked));
            }
        );
      },
    );
  }
}