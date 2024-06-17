import 'package:frontend/widgets.dart';
part 'about.g.dart';

@TypedGoRoute<AboutRoute>(path: "/about")
class AboutRoute extends AppRoute {
  AboutRoute({super.$extra});

  @override
  String get label => "About";

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      buildAppShell(
          label: "About",
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    "images/me_2.jpg",
                    height: 64,
                    width: 64,
                  )),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Kit Isaev",
                style: Fonts.h3,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                """Senior Full-stack Engineer
React, Node.JS, Rust, GraphQL, Docker, K8s""",
                textAlign: TextAlign.center,
                style: Fonts.grey,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: Pane.sectioned(sections: [
                PaneSection.widget(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Column(
                    children: [
                      Text(
                        "Highly skilled and dedicated Senior Full-Stack Engineer with over 6 years of experience in developing robust backend systems and full-stack web applications.",
                        style: Fonts.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Expertise in backend development with Rust and Node.JS, as well as DevOps practices using Docker and Kubernetes. Proven track record in designing scalable GraphQL APIs, leading development teams, and mentoring junior developers.",
                        style: Fonts.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Adept at problem-solving and known for my strong technical and leadership skills.",
                        style: Fonts.grey,
                      ),
                    ],
                  ),
                )),
                ContactMeSection(context),
              ]))
            ],
          ));
}
