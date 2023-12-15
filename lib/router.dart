import 'package:catan_gui_flutter/auth/presentation/pages/authentication_page.dart';
import 'package:go_router/go_router.dart';

// Routes
const authenticationRoute = '/authentication';

// GoRouter configuration
final routerConfig = GoRouter(
  initialLocation: authenticationRoute,
  routes: [
    GoRoute(
      path: authenticationRoute,
      builder: (context, state) => const AuthenticationPage(),
    ),
  ],
);
