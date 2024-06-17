// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $experienceRoute,
    ];

RouteBase get $experienceRoute => GoRouteData.$route(
      path: '/experience',
      factory: $ExperienceRouteExtension._fromState,
    );

extension $ExperienceRouteExtension on ExperienceRoute {
  static ExperienceRoute _fromState(GoRouterState state) => ExperienceRoute(
        $extra: state.extra as Alignment?,
      );

  String get location => GoRouteData.$location(
        '/experience',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
