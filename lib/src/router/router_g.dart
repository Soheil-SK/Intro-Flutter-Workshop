part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $gameRoute,
      $profileRoute,
];

GoRoute get $gameRoute => GoRouteData.$route(
  path: '/game',
  factory: $GameRouteRouteExtension._fromState,
);
extension $GameRouteRouteExtension on GameRoute {
  static GameRoute _fromState(GoRouterState state) => GameRoute();

  String get location => GoRouteData.$location(
    '/game',
  );

  void go(BuildContext context) => context.go(location, extra: this);
  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $profileRoute => GoRouteData.$route(
  path: '/profile',
  factory: $ProfileRouteExtension._fromState,
);
extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute();

  String get location => GoRouteData.$location(
    '/profile',
  );

  void go(BuildContext context) => context.go(location, extra: this);
  void push(BuildContext context) => context.push(location, extra: this);
}

