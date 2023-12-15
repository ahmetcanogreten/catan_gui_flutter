import 'package:catan_gui_flutter/features/auth/presentation/pages/authentication_page.dart';
import 'package:catan_gui_flutter/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

// Routes
const authenticationRoute = '/authentication';
const homeRoute = '/home';

// GoRouter configuration
final routerConfig = GoRouter(
  initialLocation: authenticationRoute,
  routes: [
    GoRoute(
      path: authenticationRoute,
      builder: (context, state) => const AuthenticationPage(),
    ),
    GoRoute(
      path: homeRoute,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
