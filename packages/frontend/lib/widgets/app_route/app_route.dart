import 'package:frontend/widgets.dart';
import 'package:frontend/widgets/app_route/app_shell.dart';
export "./app_shell.dart" show AppShellButtonProps;

abstract class AppRoute extends GoRouteData {
  AppRoute({this.$extra});

  final Alignment? $extra;

  Widget buildChild(
      BuildContext context, GoRouterState state, AppShellBuilder buildAppShell);

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final isPortfolioOpen = context.watch<IsPortfolioOpenNotifier>().value;
    return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: buildChild(
            context,
            state,
            (
                    {required String label,
                    AppShellButtonProps? buttonProps,
                    required Widget child}) =>
                AppShell(
                    routeLabel: label,
                    isPortfolioOpen: isPortfolioOpen,
                    buttonProps: buttonProps,
                    child: child)),
        transitionsBuilder: (_, animation, __, child) {
          final curvedAnimation =
              animation.drive(CurveTween(curve: Curves.easeOut));
          return ScaleTransition(
              scale: curvedAnimation,
              alignment: $extra ?? Alignment.center,
              child: FadeTransition(opacity: curvedAnimation, child: child));
        });
  }
}

typedef AppShellBuilder = AppShell Function(
    {required String label,
    AppShellButtonProps? buttonProps,
    required Widget child});
