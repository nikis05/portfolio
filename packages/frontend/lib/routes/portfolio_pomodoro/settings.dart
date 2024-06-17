import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/routes/portfolio_pomodoro/setting.dart';
import 'package:frontend/widgets.dart';
import 'package:get_storage/get_storage.dart';

@immutable
class Settings {
  const Settings.def()
      : intervalDuration = const Duration(minutes: 25),
        shortBreakDuration = const Duration(minutes: 5),
        longBreakDuration = const Duration(minutes: 15),
        numIntervals = 3;

  Settings.fromJson(Map<String, dynamic> json)
      : this._(
            intervalDuration: Duration(minutes: json[_keyIntervalDuration]),
            shortBreakDuration: Duration(minutes: json[_keyShortBreakDuration]),
            longBreakDuration: Duration(minutes: json[_keyLongBreakDuration]),
            numIntervals: json[_keyNumIntervals]);

  const Settings._(
      {required this.intervalDuration,
      required this.shortBreakDuration,
      required this.longBreakDuration,
      required this.numIntervals});

  final Duration intervalDuration;
  final Duration shortBreakDuration;
  final Duration longBreakDuration;
  final int numIntervals;

  static const _keyIntervalDuration = "intervalDuration";
  static const _keyShortBreakDuration = "shortBreakDuration";
  static const _keyLongBreakDuration = "longBreakDuration";
  static const _keyNumIntervals = "numIntervals";

  Map<String, dynamic> toJson() => {
        _keyIntervalDuration: intervalDuration.inMinutes,
        _keyShortBreakDuration: shortBreakDuration.inMinutes,
        _keyLongBreakDuration: longBreakDuration.inMinutes,
        _keyNumIntervals: numIntervals
      };

  Settings withIntervalDuration(Duration intervalDuration) => Settings._(
      intervalDuration: intervalDuration,
      shortBreakDuration: shortBreakDuration,
      longBreakDuration: longBreakDuration,
      numIntervals: numIntervals);

  Settings withShortBreakDuration(Duration shortBreakDuration) => Settings._(
      intervalDuration: intervalDuration,
      shortBreakDuration: shortBreakDuration,
      longBreakDuration: longBreakDuration,
      numIntervals: numIntervals);

  Settings withLongBreakDuration(Duration longBreakDuration) => Settings._(
      intervalDuration: intervalDuration,
      shortBreakDuration: shortBreakDuration,
      longBreakDuration: longBreakDuration,
      numIntervals: numIntervals);

  Settings withNumIntervals(int numIntervals) => Settings._(
      intervalDuration: intervalDuration,
      shortBreakDuration: shortBreakDuration,
      longBreakDuration: longBreakDuration,
      numIntervals: numIntervals);
}

class SettingsNotifier extends ValueNotifier<Settings> {
  SettingsNotifier()
      : super(() {
          final json = GetStorage().read(_key);
          return json != null ? Settings.fromJson(json) : const Settings.def();
        }());

  static const _key = "pomodoro_settings";

  toJson() {}

  @override
  set value(Settings value) {
    super.value = value;
    GetStorage().write(_key, value);
  }
}
