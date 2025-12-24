import 'package:go_router/go_router.dart';
import 'package:learn_full_flutter/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/calculator',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/calculator',
      name: 'calculator',
      builder: (context, state) => CalculatorScreen(),
    ),
    GoRoute(
      path: '/weather',
      name: 'weather',
      builder: (context, state) => WeatherScreen(),
    ),

    // GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    // GoRoute(path: '/', builder: (context, state) => LoginScreen())
  ],
);
