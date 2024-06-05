import 'package:frontend/widgets.dart';
import 'package:intl/intl.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key, required this.onOpen});

  final VoidCallback onOpen;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LockScreen> {
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
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("images/background_locked.png"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
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
            ),
          ),
          AbstractButton(
              onPress: widget.onOpen,
              build: (_, bright) => Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          "VIEW RESUME",
                          style: Fonts.h4.merge(bright
                              ? null
                              : const TextStyle(color: Colors.white75)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SvgPicture.asset(
                          "icons/arrow.svg",
                          theme: SvgTheme(
                              currentColor:
                                  bright ? Colors.white : Colors.white75),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 2,
                          width: 128,
                          decoration: BoxDecoration(
                              color: bright ? Colors.white : Colors.white75,
                              borderRadius: BorderRadius.circular(2)),
                        )
                      ],
                    ),
                  ))
        ],
      ));
}
