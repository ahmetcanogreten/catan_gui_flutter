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

  final List<int> roads;
  final List<int> settlements;
  final List<int> cities;

  const UserState({
    required this.id,
    required this.user,
    required this.game,
    required this.numberOfBricks,
    required this.numberOfGrain,
    required this.numberOfLumber,
    required this.numberOfOre,
    required this.numberOfWool,
    required this.roads,
    required this.settlements,
    required this.cities,
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
        roads,
        settlements,
        cities,
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
      roads: (json['roads'] as List).cast<int>(),
      settlements: (json['settlements'] as List).cast<int>(),
      cities: (json['cities'] as List).cast<int>(),
    );
  }
}
