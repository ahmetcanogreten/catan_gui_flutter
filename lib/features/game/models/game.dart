import 'package:catan_gui_flutter/features/game/models/game_state.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final List<Resource> resources;
  // final GameState gameState;
  final List<User> users;

  const Game({
    required this.id,
    required this.startedAt,
    this.finishedAt,
    required this.resources,
    // required this.gameState,
    required this.users,
  });

  @override
  List<Object?> get props => [
        id,
        startedAt,
        finishedAt,
        resources,
        // gameState,
        users,
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
      // gameState: gameState ?? this.gameState,
      users: players ?? this.users,
    );
  }

  static Game fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      resources: (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      // gameState: GameState.fromJson(json['gameState'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
