import 'package:frontend/widgets.dart';
import './contact.dart';
part 'contacts.g.dart';

@TypedGoRoute<ContactsRoute>(path: "/contacts")
class ContactsRoute extends AppRoute {
  ContactsRoute({super.$extra});

  @override
  String get label => "Contacts";

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      buildAppShell(
          label: "Contacts",
          child: Pane.sectioned(sections: [
            Contact(
                type: "Telegram",
                value: "@nikis05",
                launchUrl: "https://t.me/nikis05"),
            Contact(
                type: "Email",
                value: "nikis05@icloud.com",
                launchUrl: "mailto:nikis05@icloud.com"),
            Contact(
                type: "LinkedIn",
                value: "kit-isaev",
                launchUrl: "https://linkedin.com/in/nikis05"),
            Contact(
                type: "GitHub",
                value: "nikis05",
                launchUrl: "https://github.com/nikis05"),
            Contact(
                type: "Medium",
                value: "@nikis05",
                launchUrl: "https://medium.com/@nikis05")
          ]));
}
