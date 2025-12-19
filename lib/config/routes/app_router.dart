import 'package:go_router/go_router.dart';
import 'package:learn_full_flutter/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => LoginScreen())],
);
