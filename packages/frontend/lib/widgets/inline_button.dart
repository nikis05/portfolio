import 'package:frontend/widgets.dart';

class InlineButton extends StatelessWidget {
  const InlineButton(
      {super.key, required this.label, this.icon, required this.onPress});

  final String label;
  final String? icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => AbstractButton(
      onPress: onPress,
      build: (_, bright) {
        final labelPart = Text(label,
            style: Fonts.inlineButton.copyWith(
                color: bright ? Colors.primaryBright : Colors.primary));
        final icon = this.icon;
        return icon == null
            ? labelPart
            : Row(children: [
                SvgPicture.asset(
                  "icons/$icon.svg",
                  theme: SvgTheme(
                      currentColor:
                          bright ? Colors.primaryBright : Colors.primary),
                ),
                labelPart
              ]);
      });
}
