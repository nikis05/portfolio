// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $skillsRoute,
    ];

RouteBase get $skillsRoute => GoRouteData.$route(
      path: '/skills',
      factory: $SkillsRouteExtension._fromState,
    );

extension $SkillsRouteExtension on SkillsRoute {
  static SkillsRoute _fromState(GoRouterState state) => SkillsRoute(
        $extra: state.extra as Alignment?,
      );

  String get location => GoRouteData.$location(
        '/skills',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
