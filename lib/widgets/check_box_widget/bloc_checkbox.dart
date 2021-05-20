import 'package:bloc/bloc.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_event.dart';
import 'package:math_statistics/widgets/check_box_widget/checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {

  CheckboxBloc() : super(CheckboxValueState.unchecked());

  @override
  Stream<CheckboxState> mapEventToState(CheckboxEvent event) async* {
    if (event is CheckboxChangeValue) {
      yield event.isChecked ? CheckboxValueState.checked() : CheckboxValueState.unchecked();
    }
  }
}