// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $contactsRoute,
    ];

RouteBase get $contactsRoute => GoRouteData.$route(
      path: '/contacts',
      factory: $ContactsRouteExtension._fromState,
    );

extension $ContactsRouteExtension on ContactsRoute {
  static ContactsRoute _fromState(GoRouterState state) => ContactsRoute(
        $extra: state.extra as Alignment?,
      );

  String get location => GoRouteData.$location(
        '/contacts',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
