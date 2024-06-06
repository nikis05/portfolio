import 'package:frontend/routes/shell/clock.dart';
import './title.dart';
import 'package:frontend/widgets.dart' hide Title;

class LockScreen extends StatelessWidget {
  const LockScreen(
      {super.key,
      required this.onOpen,
      required this.renderTitle,
      required this.fillBackground});

  final VoidCallback onOpen;
  final bool renderTitle;
  final bool fillBackground;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: fillBackground ? BoxFit.cover : BoxFit.fitHeight,
              image: const AssetImage("images/background_locked.png"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 32),
              child: renderTitle ? const Title() : const Clock()),
          AbstractButton(
              onPress: onOpen,
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
