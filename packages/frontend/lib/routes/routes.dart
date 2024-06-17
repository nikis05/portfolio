import 'package:frontend/widgets.dart';
import 'shell/shell.dart';
import './home/home.dart' as home;
import './about/about.dart' as about;
import './experience/experience.dart' as experience;
import './skills/skills.dart' as skills;
import './contacts/contacts.dart' as contacts;
import './services/services.dart' as services;
import './portfolio_pomodoro/portfolio_pomodoro.dart' as portfolio_pomodoro;

export './home/home.dart' show HomeRoute, $HomeRouteExtension;
export './about/about.dart' show AboutRoute, $AboutRouteExtension;
export './experience/experience.dart'
    show ExperienceRoute, $ExperienceRouteExtension;
export './skills/skills.dart' show SkillsRoute, $SkillsRouteExtension;
export './contacts/contacts.dart' show ContactsRoute, $ContactsRouteExtension;
export './services/services.dart' show ServicesRoute, $ServicesRouteExtension;
export './portfolio_pomodoro/portfolio_pomodoro.dart'
    show PortfolioPomodoroRoute, $PortfolioPomodoroRouteExtension;

final router = GoRouter(routes: [
  ShellRoute(
    routes: [
      ...home.$appRoutes,
      ...about.$appRoutes,
      ...experience.$appRoutes,
      ...skills.$appRoutes,
      ...contacts.$appRoutes,
      ...services.$appRoutes,
      ...portfolio_pomodoro.$appRoutes
    ],
    builder: (_, __, child) => Shell(child: child),
  )
]);
