import 'package:frontend/routes/services/service.dart';
import 'package:frontend/widgets.dart';
import 'package:intersperse/intersperse.dart';
part 'services.g.dart';

@TypedGoRoute<ServicesRoute>(path: "/services")
class ServicesRoute extends AppRoute {
  ServicesRoute({super.$extra});

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      buildAppShell(
          label: "Services",
          child: ListView(
            children: const <Widget>[
              Service(
                  name: "IT Consulting",
                  description: TextSpan(
                      text:
                          "An industry expert with years of experience, thousands of complex technical decisions and successful solutions behind me, I will confidently navigate you through any digital challenges that your business may face.\n\n",
                      children: [
                        TextSpan(text: "Pricing: ", style: Fonts.semiBold),
                        TextSpan(text: "\$99/h.\n\n"),
                        TextSpan(
                            text:
                                "For my new clients, I provide a free consulting session.",
                            style: Fonts.semiBold)
                      ])),
              Service(
                  name: "Turnkey web, mobile & desktop app development",
                  description: TextSpan(
                      text: """From idea to  app in a matter of weeks.

Complete end-to-end services, including design, development, quality assurance, deployment, and ongoing support. I will carefully collect your requirements and discuss with you how to best serve your users - then deliver a reliable, high-quality solution that will make your business stand out.\n\n""",
                      children: [
                        TextSpan(
                            text: "Pricing depends on your requirements",
                            style: Fonts.semiBold),
                        TextSpan(
                            text:
                                " - from \$1000 for a simple app with few screens and no backend to \$8000 for a complex app with dozens of screens and third-party integrations (e.g. payments). You pay as we go - we split the project into milestones and you only pay once a certain milestone has been completed.\n\n"),
                        TextSpan(
                            text:
                                "Arrange a free consulting session with me to evaluate the costs.",
                            style: Fonts.semiBold)
                      ])),
              Service(
                  name:
                      "Frontend development (web, mobile, desktop, cross-platform)",
                  description: TextSpan(
                      text:
                          "Frontend development using JavaScript, HTML, CSS, React, Electron, Dart, Flutter.\n\n",
                      children: [
                        TextSpan(
                            text:
                                """Pay on an hourly (\$100/h) or a per-project basis.

Arrange a free consulting session with me to discuss your project.""",
                            style: Fonts.semiBold)
                      ])),
              Service(
                  name: "Backend development",
                  description: TextSpan(
                      text:
                          "Backend development using Node.JS, Rust, Postgres, MongoDB, Redis, RabbitMQ.\n\n",
                      children: [
                        TextSpan(
                            text:
                                """Pay on an hourly (\$100/h) or a per-project basis.

Arrange a free consulting session with me to discuss your project.""",
                            style: Fonts.semiBold)
                      ])),
              Service(
                  name: "DevOps",
                  description: TextSpan(
                      text:
                          "DevOps using Docker, GitHub Actions, Kubernetes.\n\n",
                      children: [
                        TextSpan(
                            text:
                                """Pay on an hourly (\$100/h) or a per-project basis.

Arrange a free consulting session with me to discuss your project.""",
                            style: Fonts.semiBold)
                      ])),
              Service(
                  name: "Software Engineering Mentorship",
                  description: TextSpan(
                      text:
                          "I really enjoy sharing knowledge, and am pretty good at explaining complex concepts. I will help you set up an individual learning plan that would help you achieve your goals as swiftly as possible, and will be available for your questions at any time.\n\n",
                      children: [
                        TextSpan(
                            text: "Pricing: \$75/h.", style: Fonts.semiBold)
                      ])),
            ]
                .intersperse(const SizedBox(
                  height: 16,
                ))
                .toList(),
          ));
}
