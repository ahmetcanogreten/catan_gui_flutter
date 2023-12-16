import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/features/game/models/game_state.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';

abstract interface class IGameRepository {
  Future<int> createGame({required int roomId});

  Future<Game> getGame({required int gameId});

  Future<GameState> getGameState({required int gameId});
}

class MockGameRepository implements IGameRepository {
  final List<Resource> resources = const [
    Resource(index: 0, type: ResourceType.hills, number: 2),
    Resource(index: 1, type: ResourceType.hills, number: 3),
    Resource(index: 2, type: ResourceType.hills, number: 3),
    Resource(index: 3, type: ResourceType.mountains, number: 4),
    Resource(index: 4, type: ResourceType.mountains, number: 4),
    Resource(index: 5, type: ResourceType.mountains, number: 5),
    Resource(index: 6, type: ResourceType.forest, number: 5),
    Resource(index: 7, type: ResourceType.forest, number: 6),
    Resource(index: 8, type: ResourceType.forest, number: 6),
    Resource(index: 9, type: ResourceType.forest, number: 8),
    Resource(index: 10, type: ResourceType.fields, number: 8),
    Resource(index: 11, type: ResourceType.fields, number: 9),
    Resource(index: 12, type: ResourceType.fields, number: 9),
    Resource(index: 13, type: ResourceType.fields, number: 10),
    Resource(index: 14, type: ResourceType.pasture, number: 10),
    Resource(index: 15, type: ResourceType.pasture, number: 11),
    Resource(index: 16, type: ResourceType.pasture, number: 11),
    Resource(index: 17, type: ResourceType.pasture, number: 12),
  ];

  User turnPlayer = const User(
    id: "1",
    firstName: "Ahmet Can",
    lastName: "Öğreten",
    email: "",
  );

  List<User> players = [
    const User(
      id: "1",
      firstName: "Ahmet Can",
      lastName: "Öğreten",
      email: "",
    ),
    const User(
      id: "2",
      firstName: "Bot",
      lastName: "1",
      email: "",
    ),
    const User(
      id: "3",
      firstName: "Bot",
      lastName: "2",
      email: "",
    ),
    const User(
      id: "4",
      firstName: "Bot",
      lastName: "3",
      email: "",
    ),
  ];
  Map? board = {};

  @override
  Future<int> createGame({required int roomId}) async {
    await Future.delayed(const Duration(seconds: 1));
    return 1;
  }

  @override
  Future<Game> getGame({required int gameId}) async {
    await Future.delayed(const Duration(seconds: 1));

    return Game(
      id: 1,
      startedAt: DateTime.now(),
      finishedAt: null,
      resources: resources,
      gameState: GameState(
        id: 1,
        turnPlayer: turnPlayer,
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
