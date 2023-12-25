import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:equatable/equatable.dart';

class GameLog extends Equatable {
  final int id;
  final Game game;
  final String log;

  const GameLog({
    required this.id,
    required this.game,
    required this.log,
  });

  @override
  List<Object?> get props => [game, log];

  static GameLog fromJson(Map<String, dynamic> json) => GameLog(
        id: json['id'],
        game: Game.fromJson(json['game']),
        log: json['log'],
      );
}
