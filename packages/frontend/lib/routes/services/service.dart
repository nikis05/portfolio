import 'package:frontend/widgets.dart';

class Service extends StatelessWidget {
  const Service({super.key, required this.name, required this.description});

  final String name;
  final InlineSpan description;

  @override
  Widget build(BuildContext context) => Pane(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Colors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Fonts.semiBold,
              ),
              const SizedBox(
                height: 4,
              ),
              Text.rich(description)
            ],
          )
        ],
      ));
}
