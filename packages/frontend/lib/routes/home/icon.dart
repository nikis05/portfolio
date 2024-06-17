import 'package:frontend/widgets.dart';

class Icon extends StatelessWidget {
  const Icon(
      {super.key,
      required this.image,
      required this.label,
      this.large = false,
      this.opaqueBackground = false,
      required this.onPress});

  final String image;
  final String label;
  final bool large;
  final bool opaqueBackground;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => AbstractButton(
      onPress: onPress,
      build: (context, bright) => SizedBox(
          width: large ? 108 : 50,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: large ? 108 : 42,
              width: large ? 108 : 42,
              decoration: BoxDecoration(
                  color: opaqueBackground ? Colors.white25 : null,
                  borderRadius: BorderRadius.circular(large ? 16 : 8),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
              child: bright ? const ColoredBox(color: Colors.white25) : null,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              label,
              style: Fonts.iconLabel,
            )
          ])));
}
