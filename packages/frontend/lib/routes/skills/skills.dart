import 'package:frontend/widgets.dart';
import './skill.dart';
part 'skills.g.dart';

@TypedGoRoute<SkillsRoute>(path: "/skills")
class SkillsRoute extends AppRoute {
  SkillsRoute({super.$extra});

  @override
  Widget buildChild(BuildContext context, GoRouterState state,
          AppShellBuilder buildAppShell) =>
      buildAppShell(
          label: "Skills",
          child: Pane.sectioned(sections: [
            Skill(
                image: "consulting",
                name: "IT consulting",
                level: SkillLevel.expert),
            Skill(
                image: "leadership",
                name: "Technical leadership",
                level: SkillLevel.proficient),
            Skill(
                image: "mentorship",
                name: "Team mentorship",
                level: SkillLevel.expert),
            Skill(
                image: "design",
                name: "Software design",
                level: SkillLevel.expert),
            Skill(
                image: "testing",
                name: "Software testing",
                level: SkillLevel.proficient),
            Skill(
                image: "javascript",
                name: "JavaScript",
                level: SkillLevel.expert),
            Skill(image: "html", name: "HTML", level: SkillLevel.proficient),
            Skill(image: "css", name: "CSS", level: SkillLevel.proficient),
            Skill(image: "react", name: "React", level: SkillLevel.expert),
            Skill(image: "dart", name: "Dart", level: SkillLevel.proficient),
            Skill(
                image: "flutter",
                name: "Flutter",
                level: SkillLevel.proficient),
            Skill(
                image: "rest-api",
                name: "RESTful APIs",
                level: SkillLevel.expert),
            Skill(image: "graphql", name: "GraphQL", level: SkillLevel.expert),
            Skill(image: "rust", name: "Rust", level: SkillLevel.expert),
            Skill(image: "nodejs", name: "Node.JS", level: SkillLevel.expert),
            Skill(
                image: "postgres",
                name: "PostgreSQL",
                level: SkillLevel.proficient),
            Skill(
                image: "mongodb",
                name: "MongoDB",
                level: SkillLevel.proficient),
            Skill(image: "redis", name: "Redis", level: SkillLevel.proficient),
            Skill(
                image: "rabbitmq",
                name: "RabbitMQ",
                level: SkillLevel.competent),
            Skill(image: "ci", name: "CI / CD", level: SkillLevel.expert),
            Skill(
                image: "gh-actions",
                name: "GitHub Actions",
                level: SkillLevel.expert),
            Skill(image: "docker", name: "Docker", level: SkillLevel.expert),
            Skill(
                image: "kubernetes",
                name: "Kubernetes",
                level: SkillLevel.proficient),
            Skill(image: "helm", name: "Helm", level: SkillLevel.competent),
            Skill(
                image: "microservices",
                name: "Microservice architecture",
                level: SkillLevel.expert),
            Skill(image: "unix", name: "Unix", level: SkillLevel.competent),
            Skill(image: "git", name: "Git", level: SkillLevel.proficient)
          ]));
}
