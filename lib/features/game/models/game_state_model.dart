import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class GameStateModel extends Equatable {
  final int id;
  final User turnUser;
  final Map? board;

  const GameStateModel(
      {required this.id, required this.turnUser, required this.board});

  @override
  List<Object> get props => [
        id,
        turnUser,
        board ?? 0,
      ];

  static GameStateModel fromJson(Map<String, dynamic> json) {
    return GameStateModel(
      id: json['id'] as int,
      turnUser: User.fromJson(json['turnUser'] as Map<String, dynamic>),
      board: json['board'] as Map?,
    );
  }
}
