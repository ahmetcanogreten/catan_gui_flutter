import 'package:catan_gui_flutter/api/api_client.dart';
import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/features/game/models/game_log.dart';
import 'package:catan_gui_flutter/features/game/models/game_state_model.dart';
import 'package:catan_gui_flutter/features/game/models/user_options.dart';
import 'package:catan_gui_flutter/features/game/models/user_with_in_game_points.dart';
import 'package:catan_gui_flutter/models/user_state.dart';

abstract interface class IGameRepository {
  Future<Game> createGame({required int roomId});

  Future<Game> getGame({required int gameId});

  Future<Game> getGameByRoomId({required int roomId});

  Future<GameStateModel> getGameState({required int gameId});

  Future<List<UserState>> getUserStates({required int gameId});

  Future<GameStateModel> rollDice(
      {required int gameId,
      required int dice1,
      required int dice2,
      required String userId});

  Future<GameStateModel> endTurn({required int gameId, required String userId});

  Future<GameStateModel> buildRoad(
      {required int gameId, required int roadIndex, required String userId});

  Future<GameStateModel> buildSettlement(
      {required int gameId,
      required int settlementIndex,
      required String userId});

  Future<GameStateModel> buildCity(
      {required int gameId, required int cityIndex, required String userId});

  Future<UserOptions> getUserOptions(
      {required int gameId, required String userId});

  Future<void> chooseSettlementAndRoadForBot({
    required int gameId,
    required String userId,
  });

  Future<Map<int, List<int>>> loadAvailableSettlementsAndRoadsToChoose({
    required int gameId,
    required String userId,
  });

  Future<void> chooseSettlement({
    required int settlementIndex,
    required int gameId,
    required String userId,
  });

  Future<void> chooseRoad({
    required int roadIndex,
    required int gameId,
    required String userId,
  });

  Future<List<GameLog>> getGameLogs({required int gameId});

  Future<List<UserWithInGamePoints>> getUsersWithInGamePoints(
      {required int gameId});

  Future<void> createTradeOffer({
    required int gameId,
    required int wantHills,
    required int wantForest,
    required int wantMountains,
    required int wantFields,
    required int wantPasture,
    required int giveHills,
    required int giveForest,
    required int giveMountains,
    required int giveFields,
    required int givePasture,
  });

  Future<void> acceptTradeOffer({
    required int gameId,
    required String userId,
  });

  Future<void> cancelTradeOffer({
    required int gameId,
  });
}

class BackendGameRepository implements IGameRepository {
  @override
  Future<void> createTradeOffer({
    required int gameId,
    required int wantHills,
    required int wantForest,
    required int wantMountains,
    required int wantFields,
    required int wantPasture,
    required int giveHills,
    required int giveForest,
    required int giveMountains,
    required int giveFields,
    required int givePasture,
  }) async {
    await apiClient.post("/api/games/$gameId/trades", data: {
      "wantHills": wantHills,
      "wantForest": wantForest,
      "wantMountains": wantMountains,
      "wantFields": wantFields,
      "wantPasture": wantPasture,
      "giveHills": giveHills,
      "giveForest": giveForest,
      "giveMountains": giveMountains,
      "giveFields": giveFields,
      "givePasture": givePasture,
    });
  }

  @override
  Future<void> acceptTradeOffer({
    required int gameId,
    required String userId,
  }) async {
    await apiClient.post("/api/games/$gameId/accept-trade",
        queryParameters: {"userId": userId});
  }

  @override
  Future<void> cancelTradeOffer({
    required int gameId,
  }) async {
    await apiClient.post("/api/games/$gameId/cancel-trade");
  }

  @override
  Future<Game> getGameByRoomId({required int roomId}) async {
    final response = await apiClient.get("/api/games/room/$roomId");

    return Game.fromJson(response.data);
  }

  @override
  Future<List<UserWithInGamePoints>> getUsersWithInGamePoints(
      {required int gameId}) async {
    final response = await apiClient.get("/api/games/$gameId/users-points");

    return (response.data as List)
        .map((e) => UserWithInGamePoints.fromJson(e))
        .toList();
  }

  @override
  Future<List<GameLog>> getGameLogs({required int gameId}) async {
    final response = await apiClient.get("/api/games/$gameId/logs");

    return (response.data as List).map((e) => GameLog.fromJson(e)).toList();
  }

  @override
  Future<void> chooseRoad({
    required int roadIndex,
    required int gameId,
    required String userId,
  }) async {
    await apiClient.post("/api/games/$gameId/choose-road",
        queryParameters: {"userId": userId, "roadIndex": roadIndex});
  }

  @override
  Future<void> chooseSettlement({
    required int settlementIndex,
    required int gameId,
    required String userId,
  }) async {
    await apiClient.post("/api/games/$gameId/choose-settlement",
        queryParameters: {
          "userId": userId,
          "settlementIndex": settlementIndex
        });
  }

  @override
  Future<Map<int, List<int>>> loadAvailableSettlementsAndRoadsToChoose({
    required int gameId,
    required String userId,
  }) async {
    final response = await apiClient.get(
        "/api/games/$gameId/available-settlements-and-roads-to-choose",
        queryParameters: {"userId": userId});

    return (response.data as Map).map((key, value) => MapEntry(
        int.parse(key), (value as List).map((e) => e as int).toList()));
  }

  @override
  Future<void> chooseSettlementAndRoadForBot({
    required int gameId,
    required String userId,
  }) async {
    await apiClient.post(
        "/api/games/$gameId/choose-settlement-and-road-for-bot?userId=$userId");
  }

  @override
  Future<UserOptions> getUserOptions({
    required int gameId,
    required String userId,
  }) async {
    final response = await apiClient.get("/api/games/$gameId/user-options",
        queryParameters: {"userId": userId});

    return UserOptions.fromJson(response.data);
  }

  @override
  Future<GameStateModel> buildCity({
    required int gameId,
    required int cityIndex,
    required String userId,
  }) async {
    final response = await apiClient.post("/api/games/$gameId/build-city",
        data: {"userId": userId, "index": cityIndex});

    return GameStateModel.fromJson(response.data);
  }

  @override
  Future<GameStateModel> buildSettlement({
    required int gameId,
    required int settlementIndex,
    required String userId,
  }) async {
    final response = await apiClient.post("/api/games/$gameId/build-settlement",
        data: {"userId": userId, "index": settlementIndex});

    return GameStateModel.fromJson(response.data);
  }

  @override
  Future<GameStateModel> buildRoad({
    required int gameId,
    required int roadIndex,
    required String userId,
  }) async {
    final response = await apiClient.post("/api/games/$gameId/build-road",
        data: {"userId": userId, "index": roadIndex});

    return GameStateModel.fromJson(response.data);
  }

  @override
  Future<Game> createGame({required int roomId}) async {
    final response = await apiClient.post("/api/games?roomId=$roomId");

    return Game.fromJson(response.data);
  }

  @override
  Future<Game> getGame({required int gameId}) async {
    final response = await apiClient.get("/api/games/$gameId");

    return Game.fromJson(response.data);
  }

  @override
  Future<GameStateModel> getGameState({required int gameId}) async {
    final response = await apiClient.get("/api/games/$gameId/state");

    return GameStateModel.fromJson(response.data);
  }

  @override
  Future<List<UserState>> getUserStates({required int gameId}) async {
    final response = await apiClient.get("/api/games/$gameId/user-states");

    return (response.data as List).map((e) => UserState.fromJson(e)).toList();
  }

  @override
  Future<GameStateModel> rollDice({
    required int gameId,
    required int dice1,
    required int dice2,
    required String userId,
  }) async {
    final response = await apiClient.post("/api/games/$gameId/roll",
        data: {"userId": userId, "dice1": dice1, "dice2": dice2});

    return GameStateModel.fromJson(response.data);
  }

  @override
  Future<GameStateModel> endTurn({
    required int gameId,
    required String userId,
  }) async {
    final response =
        await apiClient.post("/api/games/$gameId/end-turn?userId=$userId");

    return GameStateModel.fromJson(response.data);
  }
}

// class MockGameRepository implements IGameRepository {
//   final List<Resource> resources = const [
//     Resource(index: 0, type: ResourceType.hills, number: 2),
//     Resource(index: 1, type: ResourceType.hills, number: 3),
//     Resource(index: 2, type: ResourceType.hills, number: 3),
//     Resource(index: 3, type: ResourceType.mountains, number: 4),
//     Resource(index: 4, type: ResourceType.mountains, number: 4),
//     Resource(index: 5, type: ResourceType.mountains, number: 5),
//     Resource(index: 6, type: ResourceType.forest, number: 5),
//     Resource(index: 7, type: ResourceType.forest, number: 6),
//     Resource(index: 8, type: ResourceType.forest, number: 6),
//     Resource(index: 9, type: ResourceType.forest, number: 8),
//     Resource(index: 10, type: ResourceType.fields, number: 8),
//     Resource(index: 11, type: ResourceType.fields, number: 9),
//     Resource(index: 12, type: ResourceType.fields, number: 9),
//     Resource(index: 13, type: ResourceType.fields, number: 10),
//     Resource(index: 14, type: ResourceType.pasture, number: 10),
//     Resource(index: 15, type: ResourceType.pasture, number: 11),
//     Resource(index: 16, type: ResourceType.pasture, number: 11),
//     Resource(index: 17, type: ResourceType.pasture, number: 12),
//   ];

//   User turnPlayer = const User(
//     id: "1",
//     firstName: "Ahmet Can",
//     lastName: "Öğreten",
//     email: "",
//     isBot: false,
//   );

//   List<User> players = [
//     const User(
//       id: "1",
//       firstName: "Ahmet Can",
//       lastName: "Öğreten",
//       email: "",
//       isBot: true,
//     ),
//     const User(
//       id: "2",
//       firstName: "Bot",
//       lastName: "1",
//       email: "",
//       isBot: true,
//     ),
//     const User(
//       id: "3",
//       firstName: "Bot",
//       lastName: "2",
//       email: "",
//       isBot: true,
//     ),
//     const User(
//       id: "4",
//       firstName: "Bot",
//       lastName: "3",
//       email: "",
//       isBot: true,
//     ),
//   ];
//   Map? board = {};

//   @override
//   Future<void> chooseSettlementAndRoadForBot({
//     required int gameId,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));
//   }

//   @override
//   Future<UserOptions> getUserOptions({
//     required int gameId,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return UserOptions(
//       availableRoads: [1, 2, 3],
//       availableSettlements: [1, 2, 3],
//       availableCities: [1, 2, 3],
//     );
//   }

//   @override
//   Future<GameStateModel> buildCity({
//     required int gameId,
//     required int cityIndex,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.roll,
//     );
//   }

//   @override
//   Future<GameStateModel> buildSettlement({
//     required int gameId,
//     required int settlementIndex,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.roll,
//     );
//   }

//   @override
//   Future<GameStateModel> buildRoad({
//     required int gameId,
//     required int roadIndex,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.roll,
//     );
//   }

//   @override
//   Future<GameStateModel> endTurn({
//     required int gameId,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.roll,
//     );
//   }

//   @override
//   Future<Game> createGame({required int roomId}) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return Game(
//       id: 1,
//       startedAt: DateTime.now(),
//       finishedAt: null,
//       resources: resources,
//       users: players,
//       usersCycle: players.map((e) => e.id).toList(),
//       room: Room(
//         id: 1,
//         name: "Room",
//         code: "123456",
//         gameStarted: false,
//         owner: players.first,
//         users: players,
//         resources: resources,
//       ),
//     );
//   }

//   @override
//   Future<Game> getGame({required int gameId}) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return Game(
//       id: 1,
//       startedAt: DateTime.now(),
//       finishedAt: null,
//       resources: resources,
//       users: players,
//       usersCycle: players.map((e) => e.id).toList(),
//       room: Room(
//         id: 1,
//         name: "Room",
//         code: "123456",
//         gameStarted: false,
//         owner: players.first,
//         users: players,
//         resources: resources,
//       ),
//     );
//   }

//   @override
//   Future<GameStateModel> getGameState({required int gameId}) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.roll,
//     );
//   }

//   @override
//   Future<List<UserState>> getUserStates({required int gameId}) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return players
//         .map((e) => UserState(
//               id: 1,
//               user: e,
//               game: Game(
//                 id: 1,
//                 startedAt: DateTime.now(),
//                 finishedAt: null,
//                 resources: resources,
//                 users: players,
//                 usersCycle: players.map((e) => e.id).toList(),
//                 room: Room(
//                   id: 1,
//                   name: "Room",
//                   code: "123456",
//                   gameStarted: false,
//                   owner: players.first,
//                   users: players,
//                   resources: resources,
//                 ),
//               ),
//               numberOfBricks: 0,
//               numberOfGrain: 0,
//               numberOfLumber: 0,
//               numberOfOre: 0,
//               numberOfWool: 0,
//               roads: const [],
//               settlements: const [],
//               cities: const [],
//             ))
//         .toList();
//   }

//   @override
//   Future<GameStateModel> rollDice({
//     required int gameId,
//     required int dice1,
//     required int dice2,
//     required String userId,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return GameStateModel(
//       id: 1,
//       turnUser: turnPlayer,
//       turnState: TurnState.build,
//       dice1: 1,
//       dice2: 1,
//     );
//   }
// }
