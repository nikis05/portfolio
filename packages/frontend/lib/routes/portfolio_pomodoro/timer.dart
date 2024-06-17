import 'package:frontend/routes/portfolio_pomodoro/interval_marker.dart';
import 'package:frontend/routes/portfolio_pomodoro/next_prev_button.dart';
import 'package:frontend/routes/portfolio_pomodoro/settings.dart';
import 'package:frontend/routes/portfolio_pomodoro/timer_model.dart';
import 'package:frontend/widgets.dart';
import 'package:intersperse/intersperse.dart';
import 'package:listenable_stream/listenable_stream.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key, required this.settings});

  final Settings settings;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TimerScreen> {
  late final TimerModel _model;
  late final Stream<TimerState> _stateStream;
  late final Stream<Duration> _durationStream;

  @override
  void initState() {
    super.initState();
    _model = TimerModel(settings: widget.settings);
    final sourceStream = _model.toValueStream().asBroadcastStream();
    _stateStream = sourceStream
      ..distinct((prev, next) =>
          prev.completedIntervals != next.completedIntervals ||
          prev.isPaused != next.isPaused ||
          prev.breaking != next.breaking ||
          prev.intervalStarted != next.intervalStarted);
    _durationStream =
        sourceStream.map((state) => state.remainingDuration).distinct();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
      child: StreamBuilder(
          initialData: _model.value,
          stream: _stateStream,
          builder: (_, snapshot) {
            final state = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.breaking ? "Break" : "Interval",
                  style: Fonts.h3,
                ),
                StreamBuilder(
                    initialData: _model.value.remainingDuration,
                    stream: _durationStream,
                    builder: (_, snapshot) {
                      final remainingDuration = snapshot.data!;
                      return Text(
                        "${remainingDuration.inMinutes.toString().padLeft(2, "0")}:${remainingDuration.inSeconds.remainder(Duration.secondsPerMinute).toString().padLeft(2, "0")}",
                        style: Fonts.h1,
                      );
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NextPrevButton(
                        direction: NextPrevButtonDirection.prev,
                        onPress: _model.prev),
                    ...Iterable.generate(
                        state.completedIntervals,
                        (_) => const IntervalMarker(
                            status: IntervalMarkerStatus.complete)),
                    if (state.intervalStarted)
                      const IntervalMarker(
                          status: IntervalMarkerStatus.started),
                    ...Iterable.generate(
                      widget.settings.numIntervals -
                          state.completedIntervals -
                          (state.intervalStarted ? 1 : 0),
                      (_) => const IntervalMarker(
                          status: IntervalMarkerStatus.unstarted),
                    ),
                    NextPrevButton(
                        direction: NextPrevButtonDirection.next,
                        onPress: _model.next)
                  ]
                      .intersperse(const SizedBox(
                        width: 8,
                      ))
                      .toList(),
                ),
                const SizedBox(
                  height: 24,
                ),
                AbstractButton(
                    onPress: () =>
                        state.isPaused ? _model.start() : _model.pause(),
                    build: (_, bright) => Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.primary),
                            color: bright ? Colors.dimmBright : Colors.dimm,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            state.isPaused
                                ? "icons/play.svg"
                                : "icons/pause.svg",
                            theme: const SvgTheme(currentColor: Colors.primary),
                          ),
                        ))
              ],
            );
          }));
}
