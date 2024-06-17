import 'dart:async';
import 'package:frontend/routes/portfolio_pomodoro/settings.dart';
import 'package:frontend/routes/portfolio_pomodoro/timer.dart';
import 'package:frontend/widgets.dart';
import 'settings_screen.dart';
part 'portfolio_pomodoro.g.dart';

@TypedGoRoute<PortfolioPomodoroRoute>(path: "/portfolio/pomodoro")
class PortfolioPomodoroRoute extends AppRoute {
  PortfolioPomodoroRoute({super.$extra});

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      _PortfolioPomodoro(buildAppShell: buildAppShell);
}

class _PortfolioPomodoro extends StatefulWidget {
  const _PortfolioPomodoro({required this.buildAppShell});

  final AppShellBuilder buildAppShell;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_PortfolioPomodoro> {
  bool _settingsOpen = false;
  late final SettingsNotifier _pomodoroSettings;

  @override
  void initState() {
    super.initState();
    _pomodoroSettings = SettingsNotifier();
  }

  @override
  void dispose() {
    _pomodoroSettings.dispose();
    super.dispose();
  }

  void _toggleSettingsOpen() {
    setState(() {
      _settingsOpen = !_settingsOpen;
    });
  }

  @override
  Widget build(BuildContext context) => widget.buildAppShell(
      label: "Pomodoro",
      buttonProps: AppShellButtonProps(
          label: _settingsOpen ? "Done" : "Settings",
          onPress: _toggleSettingsOpen),
      child: ValueListenableBuilder(
          valueListenable: _pomodoroSettings,
          builder: (_, pomodoroSettings, __) => _settingsOpen
              ? SettingsScreen(
                  value: pomodoroSettings,
                  onChange: (newValue) => _pomodoroSettings.value = newValue,
                )
              : TimerScreen(
                  settings: pomodoroSettings,
                )));
}
