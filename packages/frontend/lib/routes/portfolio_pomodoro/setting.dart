import 'package:frontend/routes/portfolio_pomodoro/setting_input.dart';
import 'package:frontend/widgets.dart';

class Setting extends PaneSection {
  Setting(
      {required this.label,
      required this.steps,
      this.unit,
      this.min = 0,
      this.max,
      required this.value,
      required this.onChange});

  final String label;
  final List<int> steps;
  final String? unit;
  final int? min;
  final int? max;
  final int value;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label),
        SettingInput(
            steps: steps,
            unit: unit,
            min: min,
            max: max,
            value: value,
            onChange: onChange)
      ]);
}
