import 'package:frontend/widgets/widgets.dart' hide Icon;
import './icon.dart';

class NavIcon extends StatelessWidget {
  const NavIcon(
      {super.key,
      required this.image,
      required this.label,
      this.large = false,
      this.opaqueBackground = false,
      required this.onNav});

  final String image;
  final String label;
  final bool large;
  final bool opaqueBackground;
  final void Function(BuildContext context, Alignment alignment) onNav;

  @override
  Widget build(BuildContext context) => WithGetAlignment(
      builder: (context, getAlignment) => Icon(
            image: image,
            label: label,
            large: large,
            opaqueBackground: opaqueBackground,
            onPress: () => onNav(context, getAlignment()),
          ));
}
