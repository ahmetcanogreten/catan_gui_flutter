import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

enum TurnState { choose_1, choose_2, roll, build }

TurnState turnStateFromJson(String turnState) {
  switch (turnState) {
    case 'CHOOSE_1':
      return TurnState.choose_1;
    case 'CHOOSE_2':
      return TurnState.choose_2;
    case 'ROLL':
      return TurnState.roll;
    case 'BUILD':
      return TurnState.build;
    default:
      throw Exception('Unknown turnState: $turnState');
  }
}

class GameStateModel extends Equatable {
  final int id;
  final User turnUser;
  final TurnState turnState;
  final Game game;
  final int? dice1;
  final int? dice2;

  const GameStateModel({
    required this.id,
    required this.turnUser,
    required this.turnState,
    required this.game,
    this.dice1,
    this.dice2,
  });

  @override
  List<Object> get props => [
        id,
        turnUser,
        turnState,
        game,
        dice1 ?? 0,
        dice2 ?? 0,
      ];

  static GameStateModel fromJson(Map<String, dynamic> json) {
    return GameStateModel(
      id: json['id'] as int,
      turnUser: User.fromJson(json['turnUser'] as Map<String, dynamic>),
      turnState: turnStateFromJson(json['turnState'] as String),
      game: Game.fromJson(json['game'] as Map<String, dynamic>),
      dice1: json['dice1'] as int?,
      dice2: json['dice2'] as int?,
    );
  }
}
