import 'package:frontend/widgets.dart';
import 'package:go_router/go_router.dart';
part 'home.g.dart';

@TypedGoRoute<HomeRoute>(path: "/")
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Text("home");
}
