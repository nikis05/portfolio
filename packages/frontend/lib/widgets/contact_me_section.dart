import 'package:frontend/widgets.dart';

base class ContactMeSection extends PaneSectionButton {
  ContactMeSection(BuildContext context)
      : super(
            onPress: () => {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "images/get_in_touch_blue.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Contact me"),
                  ],
                ),
                SvgPicture.asset(
                  "icons/arrow_right.svg",
                  theme: const SvgTheme(currentColor: Colors.primary),
                )
              ],
            ));
}
