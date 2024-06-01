import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/bot_nav.dart';
import './router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter( 
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return BottomNav(child);
          },
          routes: $appRoutes,
        ),
      ],
      initialLocation: '/game',
    );
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 16, 16, 16),

      ),
      routerConfig: router,
    );
  }
}