import 'package:frontend/routes/home/portfolio.dart';
import 'package:frontend/widgets.dart' hide Icon;
import 'package:frontend/routes/routes.dart';
import './nav_icon.dart';
import './icon.dart';
part 'home.g.dart';

@TypedGoRoute<HomeRoute>(path: "/")
class HomeRoute extends GoRouteData {
  late Alignment portfolioAnimationAlignment;

  @override
  Widget build(BuildContext context, GoRouterState state) => _Home();
}

class _Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_Home> {
  Alignment portfolioAnimationAlignment = Alignment.center;

  void _configurePortfolioAnimationAlignment(
      Alignment Function() getAlignment) {
    Future(() {
      final alignment = getAlignment();
      if (portfolioAnimationAlignment != alignment) {
        setState(() {
          portfolioAnimationAlignment = alignment;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortfolioOpenNotifier = context.watch<IsPortfolioOpenNotifier>();
    return CoordinateSystem(
        child: Stack(children: [
      Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavIcon(
                  image: "images/me.jpg",
                  label: "About me",
                  large: true,
                  onNav: (_, alignment) =>
                      AboutRoute($extra: alignment).go(context),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        NavIcon(
                          image: "images/icon_experience.webp",
                          label: "Experience",
                          onNav: (_, alignment) =>
                              ExperienceRoute($extra: alignment).go(context),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        NavIcon(
                          image: "images/icon_skills.webp",
                          label: "Skills",
                          onNav: (_, alignment) =>
                              SkillsRoute($extra: alignment).go(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          image: "images/icon_references.webp",
                          label: "References",
                          onPress: () {},
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        WithGetAlignment(builder: (_, getAlignment) {
                          _configurePortfolioAnimationAlignment(getAlignment);
                          return Icon(
                            image: "images/icon_portfolio.png",
                            label: "Portfolio",
                            opaqueBackground: true,
                            onPress: () => isPortfolioOpenNotifier.value = true,
                          );
                        }),
                      ],
                    )
                  ],
                )
              ],
            ),
            NavIcon(
              image: "images/icon_get_in_touch.png",
              label: "Contacts",
              onNav: (_, alignment) =>
                  ContactsRoute($extra: alignment).go(context),
            ),
          ],
        ),
      ),
      Portfolio(
          isOpen: isPortfolioOpenNotifier.value,
          animationAlignment: portfolioAnimationAlignment,
          onTapOutside: () {
            isPortfolioOpenNotifier.value = false;
          })
    ]));
  }
}
