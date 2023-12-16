import 'package:catan_gui_flutter/features/game/models/game_state.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final List<Resource> resources;
  final GameState gameState;
  final List<User> players;

  const Game({
    required this.id,
    required this.startedAt,
    this.finishedAt,
    required this.resources,
    required this.gameState,
    required this.players,
  });

  @override
  List<Object?> get props => [
        id,
        startedAt,
        finishedAt,
        resources,
        gameState,
        players,
      ];

  Game copyWith({
    int? id,
    DateTime? startedAt,
    DateTime? finishedAt,
    List<Resource>? resources,
    GameState? gameState,
    List<User>? players,
  }) {
    return Game(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      resources: resources ?? this.resources,
      gameState: gameState ?? this.gameState,
      players: players ?? this.players,
    );
  }
}
