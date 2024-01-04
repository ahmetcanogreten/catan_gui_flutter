import 'package:catan_gui_flutter/features/auth/presentation/pages/authentication_page.dart';
import 'package:catan_gui_flutter/features/game/presentation/pages/game_page.dart';
import 'package:catan_gui_flutter/features/home/presentation/pages/home_page.dart';
import 'package:catan_gui_flutter/features/join/presentation/pages/join_game_page.dart';
import 'package:catan_gui_flutter/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/pages/lobby_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// Routes
const authenticationRoute = '/authentication';
const homeRoute = '/home';
const lobbyRoute = '/home/lobby';
const joinGameRoute = '/home/join-game';
const gameRoute = '/game';
const leaderboardRoute = '/home/leaderboard';

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
            path: "lobby",
            pageBuilder: (context, state) {
              final map = state.extra as Map;

              final isOwner = map['isOwner'] as bool;
              final roomId = map['roomId'] as int?;

              return CustomTransitionPage(
                child: LobbyPage(
                  isOwner: isOwner,
                  roomId: roomId,
                ),
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
          GoRoute(
            path: "join-game",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const JoinGamePage(),
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
          GoRoute(
            path: "leaderboard",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const LeaderboardPage(),
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
    GoRoute(
      path: gameRoute,
      pageBuilder: (context, state) {
        final gameId = (state.extra as Map)['gameId'] as int;
        return CustomTransitionPage(
          child: GamePage(gameId: gameId),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    )
  ],
);
