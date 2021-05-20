abstract class CheckboxState {}

class CheckboxValueState extends CheckboxState {
  final bool isChecked;

  CheckboxValueState({this.isChecked = false});

  factory CheckboxValueState.checked() => CheckboxValueState(isChecked: true);

  factory CheckboxValueState.unchecked() => CheckboxValueState(isChecked: false);
}