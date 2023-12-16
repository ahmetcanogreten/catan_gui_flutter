import 'package:catan_gui_flutter/features/auth/presentation/pages/authentication_page.dart';
import 'package:catan_gui_flutter/features/home/presentation/pages/home_page.dart';
import 'package:catan_gui_flutter/features/new_game/presentation/pages/new_game_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// Routes
const authenticationRoute = '/authentication';
const homeRoute = '/home';
const newGameRoute = '/home/new-game';

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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: "new-game",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const NewGamePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
        ]),
  ],
);
