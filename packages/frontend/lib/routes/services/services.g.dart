// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $servicesRoute,
    ];

RouteBase get $servicesRoute => GoRouteData.$route(
      path: '/services',
      factory: $ServicesRouteExtension._fromState,
    );

extension $ServicesRouteExtension on ServicesRoute {
  static ServicesRoute _fromState(GoRouterState state) => ServicesRoute(
        $extra: state.extra as Alignment?,
      );

  String get location => GoRouteData.$location(
        '/services',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
