import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

enum TurnState { roll, build }

TurnState turnStateFromJson(String turnState) {
  switch (turnState) {
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
  final int? dice1;
  final int? dice2;

  final List<int> availableSettlementsForTurnUser;
  final List<int> availableRoadsForTurnUser;
  final List<int> availableCitiesForTurnUser;

  const GameStateModel({
    required this.id,
    required this.turnUser,
    required this.turnState,
    this.dice1,
    this.dice2,
    required this.availableSettlementsForTurnUser,
    required this.availableRoadsForTurnUser,
    required this.availableCitiesForTurnUser,
  });

  @override
  List<Object> get props => [
        id,
        turnUser,
        turnState,
        dice1 ?? 0,
        dice2 ?? 0,
        availableSettlementsForTurnUser,
        availableRoadsForTurnUser,
        availableCitiesForTurnUser,
      ];

  static GameStateModel fromJson(Map<String, dynamic> json) {
    return GameStateModel(
      id: json['id'] as int,
      turnUser: User.fromJson(json['turnUser'] as Map<String, dynamic>),
      turnState: turnStateFromJson(json['turnState'] as String),
      dice1: json['dice1'] as int?,
      dice2: json['dice2'] as int?,
      availableSettlementsForTurnUser:
          (json['availableSettlementsForTurnUser'] as List? ?? [])
              .map((e) => e as int)
              .toList(),
      availableRoadsForTurnUser:
          (json['availableRoadsForTurnUser'] as List? ?? [])
              .map((e) => e as int)
              .toList(),
      availableCitiesForTurnUser:
          (json['availableCitiesForTurnUser'] as List? ?? [])
              .map((e) => e as int)
              .toList(),
    );
  }
}
