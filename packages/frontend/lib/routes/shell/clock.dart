import 'package:frontend/widgets.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Clock> {
  _State()
      : this._fromDateStream(Stream.periodic(const Duration(milliseconds: 100))
            .map((_) => DateTime.now())
            .asBroadcastStream());

  _State._fromDateStream(Stream<DateTime> dateStream)
      : dayStream = dateStream.map(formatDay).distinct(),
        timeStream = dateStream.map(formatTime).distinct();

  late final Stream<String> dayStream;
  late final Stream<String> timeStream;

  static String formatDay(DateTime date) =>
      DateFormat("EEEE, MMMM d").format(date);

  static String formatTime(DateTime date) => DateFormat("HH:mm").format(date);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          StreamBuilder(
              initialData: formatDay(DateTime.now()),
              stream: dayStream,
              builder: (_, daySnapshot) {
                final day = daySnapshot.data!;
                return Text(day);
              }),
          StreamBuilder(
            initialData: formatTime(DateTime.now()),
            stream: timeStream,
            builder: (_, timeSnapshot) {
              final time = timeSnapshot.data!;
              return Text(
                time,
                style: Fonts.h1,
              );
            },
          )
        ],
      );
}
