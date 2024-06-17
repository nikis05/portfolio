import 'package:frontend/widgets.dart';

class SettingStepButton extends StatelessWidget {
  const SettingStepButton(
      {super.key, required this.label, required this.onPress});

  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => AbstractButton(
      onPress: onPress,
      build: (_, bright) => Container(
            color: bright ? Colors.primaryBright : Colors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            child: Text(
              label,
              style: Fonts.semiBold,
            ),
          ));
}
