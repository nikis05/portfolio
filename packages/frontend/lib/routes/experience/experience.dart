import 'package:frontend/routes/experience/experience_entry.dart';
import 'package:frontend/widgets.dart';
part 'experience.g.dart';

@TypedGoRoute<ExperienceRoute>(path: "/experience")
class ExperienceRoute extends AppRoute {
  ExperienceRoute({super.$extra});

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      buildAppShell(
          label: "Experience",
          child: Pane.sectioned(sections: [
            ExperienceEntry(
              jobName: "LEVIOSA EHF, ICELAND",
              dates: "2020-2023",
              jobTitle: "Senior Backend developer & DevOps engineer",
              description:
                  """I initially joined Leviosa as a full-stack developer and helped lay the foundation of their frontend SPA. 
              
As the team grew, I specialized in a backend development role. Among other things, I helped design flexible and robust GraphQL APIs, was a key contributor to development of early prototypes in Node.JS, and later led the transition of the server codebase to Rust, improving the performance, reliability, and security of the system. I also engineered and implemented the CI/CD pipeline using Kubernetes, Docker, and GitHub Actions, enabling fast and consistent delivery of features and updates. 
              
I've had experience leading small teams of engineers, and worked directly with the PM to collect requirements and lay out architecture for new features. Additionally, I've mentored junior developers and helped them learn Rust and best practices for web development, as well as conducted technical interviews and onboarded newcomers.""",
            ),
            ExperienceEntry(
              jobName: "FREELANCE (UPWORK)",
              dates: "2018-2020",
              jobTitle: "Fullstack JavaScript developer",
              description:
                  """As freelance developer, I worked on various small and medium-size JavaScript projects:

- Developed frontend components in React
- Helped configure Webpack pipelines
- Built API servers in Node.JS.""",
            )
          ]));
}
