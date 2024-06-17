import 'package:frontend/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Contact extends PaneSection {
  Contact({required this.type, required this.value, required this.launchUrl});

  final String type;
  final String value;
  final String launchUrl;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type),
          AbstractButton(
              onPress: () => url_launcher.launchUrl(Uri.parse(launchUrl)),
              build: (_, bright) => Text(
                    value,
                    style: Fonts.link
                        .copyWith(color: bright ? Colors.primaryBright : null),
                  ))
        ],
      );
}
