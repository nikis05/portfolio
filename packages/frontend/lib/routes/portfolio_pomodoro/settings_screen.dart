import 'package:frontend/routes/portfolio_pomodoro/setting.dart';
import 'package:frontend/routes/portfolio_pomodoro/settings.dart';
import 'package:frontend/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen(
      {super.key, required this.value, required this.onChange});

  final Settings value;
  final Function(Settings settings) onChange;

  @override
  Widget build(BuildContext context) => Pane.sectioned(sections: [
        Setting(
            label: "Interval",
            steps: [-5, -1, 1, 5],
            unit: "min",
            max: 60,
            value: value.intervalDuration.inMinutes,
            onChange: (newValue) => onChange(
                value.withIntervalDuration(Duration(minutes: newValue)))),
        Setting(
            label: "Short break",
            steps: [-5, -1, 1, 5],
            unit: "min",
            max: 60,
            value: value.shortBreakDuration.inMinutes,
            onChange: (newValue) => onChange(
                value.withShortBreakDuration(Duration(minutes: newValue)))),
        Setting(
            label: "Long break",
            steps: [-5, -1, 1, 5],
            unit: "min",
            max: 60,
            value: value.longBreakDuration.inMinutes,
            onChange: (newValue) => onChange(
                value.withLongBreakDuration(Duration(minutes: newValue)))),
        Setting(
          label: "Intervals",
          steps: [
            -1,
            1,
          ],
          min: 1,
          max: 6,
          value: value.numIntervals,
          onChange: (newValue) => onChange(value.withNumIntervals(newValue)),
        )
      ]);
}
