import 'package:frontend/routes/home/nav_icon.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/widgets.dart';

class Portfolio extends StatelessWidget {
  const Portfolio(
      {super.key,
      required this.isOpen,
      required this.animationAlignment,
      required this.onTapOutside});

  final bool isOpen;
  final Alignment animationAlignment;
  final VoidCallback onTapOutside;

  static final _key = GlobalKey();

  @override
  Widget build(BuildContext context) => AnimatedScale(
      key: _key,
      alignment: animationAlignment,
      scale: isOpen ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Center(
          child: TapRegion(
              onTapOutside: (_) => onTapOutside(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white25,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavIcon(
                      image: "images/icon_experience.webp",
                      label: "Pomodoro",
                      onNav: (_, alignment) =>
                          PortfolioPomodoroRoute($extra: alignment).go(context),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    NavIcon(
                      image: "images/icon_experience.webp",
                      label: "Todo List",
                      onNav: (_, alignment) =>
                          ExperienceRoute($extra: alignment).go(context),
                    ),
                  ],
                ),
              ))));
}
