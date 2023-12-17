import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final int id;
  final User turnUser;
  final Map? board;

  const GameState(
      {required this.id, required this.turnUser, required this.board});

  @override
  List<Object> get props => [
        id,
        turnUser,
        board ?? 0,
      ];

  static GameState fromJson(Map<String, dynamic> json) {
    return GameState(
      id: json['id'] as int,
      turnUser: User.fromJson(json['turnUser'] as Map<String, dynamic>),
      board: json['board'] as Map?,
    );
  }
}
