import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/features/game/models/game_state.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';

abstract interface class IGameRepository {
  Future<int> createGame(
      {required List<Resource> resources, required int numberOfBots});

  Future<Game> getGame({required int gameId});

  Future<GameState> getGameState({required int gameId});
}

class MockGameRepository implements IGameRepository {
  List<Resource>? resources;

  User? turnPlayer;
  List<User> players = [];
  Map? board = {};

  @override
  Future<int> createGame(
      {required List<Resource> resources, required int numberOfBots}) async {
    await Future.delayed(const Duration(seconds: 1));

    this.resources = resources;

    turnPlayer = const User(
        id: "1", firstName: 'Ahmet Can', lastName: "Öğreten", email: "");

    players = [
      turnPlayer!,
      for (var i = 0; i < numberOfBots; i++)
        User(id: "$i", firstName: "Bot $i", lastName: "", email: "")
    ];

    return 1;
  }

  @override
  Future<Game> getGame({required int gameId}) async {
    await Future.delayed(const Duration(seconds: 1));

    return Game(
      id: 1,
      startedAt: DateTime.now(),
      finishedAt: null,
      resources: resources!,
      gameState: GameState(
        id: 1,
        turnPlayer: turnPlayer!,
        board: {},
      ),
      players: players,
    );
  }

  @override
  Future<GameState> getGameState({required int gameId}) async {
    await Future.delayed(const Duration(seconds: 1));

    return GameState(
      id: 1,
      turnPlayer: turnPlayer!,
      board: {},
    );
  }
}
