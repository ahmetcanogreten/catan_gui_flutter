import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final int id;
  final User user;
  final Game game;

  final int numberOfBricks;
  final int numberOfGrain;
  final int numberOfLumber;
  final int numberOfOre;
  final int numberOfWool;

  final Map buildings;

  const UserState({
    required this.id,
    required this.user,
    required this.game,
    required this.numberOfBricks,
    required this.numberOfGrain,
    required this.numberOfLumber,
    required this.numberOfOre,
    required this.numberOfWool,
    required this.buildings,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        game,
        numberOfBricks,
        numberOfGrain,
        numberOfLumber,
        numberOfOre,
        numberOfWool,
      ];

  static UserState fromJson(Map<String, dynamic> json) {
    return UserState(
      id: json['id'],
      user: User.fromJson(json['user']),
      game: Game.fromJson(json['game']),
      numberOfBricks: json['numberOfBrick'],
      numberOfGrain: json['numberOfGrain'],
      numberOfLumber: json['numberOfLumber'],
      numberOfOre: json['numberOfOre'],
      numberOfWool: json['numberOfWool'],
      buildings: json['buildings'],
    );
  }
}
