import 'package:frontend/widgets.dart';

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) => const Column(children: [
        Text(
          "Kit Isaev",
          style: Fonts.h2,
        ),
        Text("senior software developer"),
      ]);
}
