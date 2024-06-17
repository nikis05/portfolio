// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_pomodoro.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $portfolioPomodoroRoute,
    ];

RouteBase get $portfolioPomodoroRoute => GoRouteData.$route(
      path: '/portfolio/pomodoro',
      factory: $PortfolioPomodoroRouteExtension._fromState,
    );

extension $PortfolioPomodoroRouteExtension on PortfolioPomodoroRoute {
  static PortfolioPomodoroRoute _fromState(GoRouterState state) =>
      PortfolioPomodoroRoute(
        $extra: state.extra as Alignment?,
      );

  String get location => GoRouteData.$location(
        '/portfolio/pomodoro',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
