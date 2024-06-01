import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/profile_page.dart';
import '../screens/game_page.dart';

part './router_g.dart';


@TypedGoRoute<GameRoute>(path: '/game')
@immutable
class GameRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GamePage();
  }
}

@TypedGoRoute<HomeRoute>(path: '/')
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GamePage();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
@immutable
class ProfileRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

