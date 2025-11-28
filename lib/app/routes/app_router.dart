import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/events/presentation/pages/home_page.dart';

class AppRouter {
  // Route paths
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String discoverRoute = '/discover';
  static const String createRoute = '/create';
  static const String profileRoute = '/profile';

  static const String splashName = 'splash';
  static const String homeName = 'home';
  static const String discoverName = 'discover';
  static const String createName = 'create';
  static const String profileName = 'profile';

  static final GoRouter router = GoRouter(
    initialLocation: splashRoute,
    routes: [
      GoRoute(
        path: splashRoute,
        name: splashName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: homeRoute,
        name: homeName,
        builder: (context, state) => const HomePage(),
      ),
     
    ],
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(splashRoute),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
