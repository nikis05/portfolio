import 'dart:async';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/routes/portfolio_pomodoro/settings.dart';

class TimerModel extends ChangeNotifier implements ValueListenable<TimerState> {
  TimerModel({required Settings settings})
      : _state = TimerState.initial(settings: settings) {
    _timer = PausableTimer(
        const Duration(seconds: 1), () => _applyState(_state._ticked))
      ..pause();
  }

  TimerState _state;
  late final PausableTimer _timer;

  @override
  TimerState get value => _state;

  _applyState(TimerState state) {
    if (_state._status != state._status) {
      _timer.reset();
    }
    if (state.isPaused) {
      _timer.pause();
    } else {
      _timer.start();
    }
    _state = state;
    notifyListeners();
  }

  void next() => _applyState(_state._next);

  void prev() => _applyState(_state._prev);

  void start() => _applyState(_state._started);

  void pause() => _applyState(_state._paused);

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

@immutable
class TimerState {
  const TimerState._(
      {required this.settings,
      required this.completedIntervals,
      required this.isPaused,
      required _TimerStatus status})
      : _status = status;

  const TimerState.initial({required Settings settings})
      : this._(
            settings: settings,
            completedIntervals: 0,
            isPaused: true,
            status: const _TimerStatusBeforeInterval());

  final Settings settings;
  final int completedIntervals;
  final bool isPaused;

  final _TimerStatus _status;

  bool get breaking => switch (_status) {
        _TimerStatusBeforeShortBreak() ||
        _TimerStatusShortBreak() ||
        _TimerStatusBeforeLongBreak() ||
        _TimerStatusBeforeLongBreak() =>
          true,
        _ => false
      };

  Duration get remainingDuration => switch (_status) {
        _TimerStatusWithRemainingDuration(
          remainingDuration: final remainingDuration
        ) =>
          remainingDuration,
        _TimerStatusBeforeInterval() => settings.intervalDuration,
        _TimerStatusBeforeShortBreak() => settings.shortBreakDuration,
        _TimerStatusBeforeLongBreak() => settings.longBreakDuration
      };

  bool get intervalStarted => _status is _TimerStatusInterval;

  TimerState get _next {
    final completedIntervals = switch (_status) {
      _TimerStatusBeforeInterval() ||
      _TimerStatusInterval() =>
        this.completedIntervals + 1,
      _TimerStatusBeforeShortBreak() ||
      _TimerStatusShortBreak() =>
        this.completedIntervals,
      _TimerStatusBeforeLongBreak() || _TimerStatusLongBreak() => 0
    };
    return TimerState._(
        settings: settings,
        completedIntervals: completedIntervals,
        isPaused: true,
        status: switch (_status) {
          _TimerStatusBeforeInterval() ||
          _TimerStatusInterval() =>
            completedIntervals == settings.numIntervals
                ? const _TimerStatusBeforeLongBreak()
                : const _TimerStatusBeforeShortBreak(),
          _TimerStatusBeforeShortBreak() ||
          _TimerStatusShortBreak() =>
            const _TimerStatusBeforeInterval(),
          _TimerStatusBeforeLongBreak() ||
          _TimerStatusLongBreak() =>
            const _TimerStatusBeforeInterval()
        });
  }

  TimerState get _prev => TimerState._(
      settings: settings,
      completedIntervals: switch (_status) {
        _TimerStatusBeforeInterval() ||
        _TimerStatusInterval() =>
          completedIntervals == 0 ? settings.numIntervals : completedIntervals,
        _TimerStatusBeforeShortBreak() ||
        _TimerStatusShortBreak() ||
        _TimerStatusBeforeLongBreak() ||
        _TimerStatusLongBreak() =>
          completedIntervals - 1,
      },
      isPaused: true,
      status: switch (_status) {
        _TimerStatusBeforeInterval() ||
        _TimerStatusInterval() =>
          completedIntervals == 0
              ? const _TimerStatusBeforeLongBreak()
              : const _TimerStatusBeforeShortBreak(),
        _TimerStatusBeforeShortBreak() ||
        _TimerStatusShortBreak() ||
        _TimerStatusBeforeLongBreak() ||
        _TimerStatusLongBreak() =>
          const _TimerStatusBeforeInterval()
      });

  TimerState get _started => TimerState._(
      settings: settings,
      completedIntervals: completedIntervals,
      isPaused: false,
      status: switch (_status) {
        _TimerStatusBeforeInterval() =>
          _TimerStatusInterval(remainingDuration: settings.intervalDuration),
        _TimerStatusInterval(remainingDuration: final remainingDuration) =>
          _TimerStatusInterval(remainingDuration: remainingDuration),
        _TimerStatusBeforeShortBreak() => _TimerStatusShortBreak(
            remainingDuration: settings.shortBreakDuration),
        _TimerStatusShortBreak(remainingDuration: final remainingDuration) =>
          _TimerStatusShortBreak(remainingDuration: remainingDuration),
        _TimerStatusBeforeLongBreak() =>
          _TimerStatusLongBreak(remainingDuration: settings.longBreakDuration),
        _TimerStatusLongBreak(remainingDuration: final remainingDuration) =>
          _TimerStatusLongBreak(remainingDuration: remainingDuration)
      });

  TimerState get _paused => TimerState._(
      settings: settings,
      completedIntervals: completedIntervals,
      isPaused: true,
      status: _status);

  TimerState get _ticked {
    final status = _status as _TimerStatusWithRemainingDuration;

    Duration decrementDuration(Duration duration) =>
        duration - const Duration(seconds: 1);

    return _status.remainingDuration == Duration.zero
        ? _next
        : TimerState._(
            settings: settings,
            completedIntervals: completedIntervals,
            isPaused: isPaused,
            status: switch (status) {
              _TimerStatusInterval(
                remainingDuration: final remainingDuration
              ) =>
                _TimerStatusInterval(
                    remainingDuration: decrementDuration(remainingDuration)),
              _TimerStatusShortBreak(
                remainingDuration: final remainingDuration
              ) =>
                _TimerStatusShortBreak(
                    remainingDuration: decrementDuration(remainingDuration)),
              _TimerStatusLongBreak(
                remainingDuration: final remainingDuration
              ) =>
                _TimerStatusLongBreak(
                    remainingDuration: decrementDuration(remainingDuration))
            });
  }
}

sealed class _TimerStatus {
  const _TimerStatus();
}

sealed class _TimerStatusWithRemainingDuration extends _TimerStatus {
  const _TimerStatusWithRemainingDuration({required this.remainingDuration});
  final Duration remainingDuration;
}

class _TimerStatusBeforeInterval extends _TimerStatus {
  const _TimerStatusBeforeInterval();
}

class _TimerStatusInterval extends _TimerStatusWithRemainingDuration {
  const _TimerStatusInterval({required super.remainingDuration});
}

class _TimerStatusBeforeShortBreak extends _TimerStatus {
  const _TimerStatusBeforeShortBreak();
}

class _TimerStatusShortBreak extends _TimerStatusWithRemainingDuration {
  _TimerStatusShortBreak({required super.remainingDuration});
}

class _TimerStatusBeforeLongBreak extends _TimerStatus {
  const _TimerStatusBeforeLongBreak();
}

class _TimerStatusLongBreak extends _TimerStatusWithRemainingDuration {
  _TimerStatusLongBreak({required super.remainingDuration});
}
