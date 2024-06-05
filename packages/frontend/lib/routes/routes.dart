import 'package:go_router/go_router.dart';
import './home/home.dart' as home;
import 'shell/shell.dart';

final router = GoRouter(routes: [
  ShellRoute(
    routes: [...home.$appRoutes],
    builder: (_, __, child) => Shell(child: child),
  )
]);
