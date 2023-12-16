import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final int id;
  final User turnPlayer;
  final Map board;

  const GameState(
      {required this.id, required this.turnPlayer, required this.board});

  @override
  List<Object> get props => [
        id,
        turnPlayer,
        board,
      ];
}
