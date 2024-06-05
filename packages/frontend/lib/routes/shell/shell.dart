import 'package:frontend/routes/shell/curtain.dart';
import 'package:frontend/routes/shell/lock_screen.dart';
import 'package:frontend/widgets.dart';

class Shell extends StatelessWidget {
  const Shell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.black,
      child: Center(
          child: Stack(children: [
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
                    child: Curtain(child: child))))
      ])));
}
