import 'package:frontend/widgets.dart';

class NextPrevButton extends StatelessWidget {
  const NextPrevButton(
      {super.key, required this.direction, required this.onPress});

  final NextPrevButtonDirection direction;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => AbstractButton(
      onPress: onPress,
      build: (_, bright) => SvgPicture.asset(
            direction == NextPrevButtonDirection.next
                ? "icons/arrow_right.svg"
                : "icons/arrow_left.svg",
            theme:
                SvgTheme(currentColor: bright ? Colors.white75 : Colors.white),
          ));
}

enum NextPrevButtonDirection { prev, next }
