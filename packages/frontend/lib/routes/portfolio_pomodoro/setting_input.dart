import 'package:frontend/routes/portfolio_pomodoro/setting_step_button.dart';
import 'package:frontend/widgets.dart';
import 'package:intersperse/intersperse.dart';

class SettingInput extends StatefulWidget {
  SettingInput(
      {super.key,
      required this.steps,
      this.unit,
      this.min = 0,
      this.max,
      required this.value,
      required this.onChange}) {
    final validSortedSteps = [
      ...steps.where((step) {
        final valueAfterStep = value + step;
        final min = this.min;
        final max = this.max;
        if (max != null && valueAfterStep > max) return false;
        if (min != null && valueAfterStep < min) return false;
        return true;
      })
    ]..sort();
    final firstPositiveIndex = validSortedSteps.indexWhere((step) => step > 0);
    if (firstPositiveIndex != -1) {
      _stepsBeforeZero = validSortedSteps.sublist(0, firstPositiveIndex);
      _stepsAfterZero = validSortedSteps.sublist(firstPositiveIndex);
    } else {
      _stepsBeforeZero = validSortedSteps;
      _stepsAfterZero = [];
    }
  }

  final List<int> steps;
  final String? unit;
  final int? min;
  final int? max;
  final int value;
  final Function(int) onChange;

  late final List<int> _stepsBeforeZero;
  late final List<int> _stepsAfterZero;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SettingInput> {
  bool _isOpen = false;

  void handleStepButtonPress(int step) {
    widget.onChange(widget.value + step);
  }

  void _open() {
    setState(() {
      _isOpen = true;
    });
  }

  void _close() {
    setState(() {
      _isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) => TapRegion(
      onTapOutside: (_) => _close(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
              height: 24,
              child: _isOpen
                  ? Row(
                      children: widget._stepsBeforeZero
                          .map<Widget>((step) => SettingStepButton(
                              label: "${step > 0 ? "+" : ""}${step.toString()}",
                              onPress: () => handleStepButtonPress(step)))
                          .followedBy([
                            Container(
                              color: Colors.primary,
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.dimm,
                                    borderRadius: BorderRadius.circular(4)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                alignment: Alignment.center,
                                child: Text(
                                  widget.value.toString(),
                                  style: Fonts.semiBold,
                                ),
                              ),
                            )
                          ])
                          .followedBy(widget._stepsAfterZero.map((step) =>
                              SettingStepButton(
                                  label:
                                      "${step > 0 ? "+" : ""}${step.toString()}",
                                  onPress: () => handleStepButtonPress(step))))
                          .intersperse(const SizedBox(
                            width: 1,
                          ))
                          .toList(),
                    )
                  : AbstractButton(
                      onPress: _open,
                      build: (_, bright) => Container(
                            color:
                                bright ? Colors.primaryBright : Colors.primary,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            alignment: Alignment.center,
                            child: Text(widget.value.toString()),
                          )))));
}
