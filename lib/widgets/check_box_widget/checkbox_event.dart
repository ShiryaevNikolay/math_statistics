abstract class CheckboxEvent {}

class CheckboxChangeValue extends CheckboxEvent {
  final bool isChecked;

  CheckboxChangeValue({this.isChecked = false});

  factory CheckboxChangeValue.changeValueTo(bool value) => CheckboxChangeValue(isChecked: value);
}