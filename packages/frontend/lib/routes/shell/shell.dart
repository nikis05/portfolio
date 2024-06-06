import 'package:frontend/routes/shell/curtain.dart';
import 'package:frontend/routes/shell/lock_screen.dart';
import 'package:frontend/widgets.dart' hide Title;
import './title.dart';

class Shell extends StatelessWidget {
  const Shell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final renderFrame = screenSize.height >= 552 && screenSize.width >= 328;
    final renderTitleInside = !renderFrame || screenSize.height < 654;

    final curtain = Curtain(
        renderTitle: renderTitleInside,
        fillBackground: !renderFrame,
        child: child);

    return renderFrame
        ? Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (!renderTitleInside) ...[
                const Title(),
                const SizedBox(height: 16),
              ],
              Stack(children: [
                SvgPicture.asset(
                  "images/phone_frame.svg",
                  height: 520,
                  width: 296,
                ),
                Positioned(
                    top: 4,
                    left: 8,
                    right: 8,
                    bottom: 4,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 8,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: curtain)))
              ])
            ]),
          )
        : curtain;
  }
}
