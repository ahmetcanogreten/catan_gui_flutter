import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/features/game/models/game_state_model.dart';
import 'package:catan_gui_flutter/features/game/models/user_options.dart';
import 'package:catan_gui_flutter/models/user_state.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final IGameRepository _gameRepository;

  late final Game game;

  Timer? _timer;

  String? lastPlayedBotUserId;
  TurnState? lastPlayedBotTurnState;

  GameCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(GameInitial());

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void playForBot({required GameStateModel gameStateModel}) async {
    if (lastPlayedBotUserId == gameStateModel.turnUser.id &&
        lastPlayedBotTurnState == gameStateModel.turnState) {
      return;
    }

    lastPlayedBotUserId = gameStateModel.turnUser.id;

    switch (gameStateModel.turnState) {
      case TurnState.choose_1:
      case TurnState.choose_2:
        lastPlayedBotTurnState = gameStateModel.turnState;
        await _gameRepository.chooseSettlementAndRoadForBot(
            gameId: game.id, userId: gameStateModel.turnUser.id);
        break;
      case TurnState.roll:
        lastPlayedBotTurnState = TurnState.roll;
        final dice1 = Random().nextInt(6) + 1;
        final dice2 = Random().nextInt(6) + 1;

        await _gameRepository.rollDice(
          gameId: game.id,
          dice1: dice1,
          dice2: dice2,
          userId: gameStateModel.turnUser.id,
        );
        break;
      case TurnState.build:
        lastPlayedBotTurnState = TurnState.build;

        // TODO implement bot build
        await _gameRepository.endTurn(
          gameId: game.id,
          userId: gameStateModel.turnUser.id,
        );
        break;
    }
    // await _gameRepository.rollDice(
    //     gameId: gameId, dice1: 1, dice2: 1, userId: gameStateModel.turnUser.id);
  }

  void startGetGameStateTimer({required int gameId}) async {
    emit(GameLoading());

    game = await _gameRepository.getGame(gameId: gameId);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final userStates = await _gameRepository.getUserStates(
        gameId: gameId,
      );

      final gameStateModel = await _gameRepository.getGameState(
        gameId: gameId,
      );

      final userOptions = await _gameRepository.getUserOptions(
        gameId: gameId,
        userId: (GetIt.I.get<AuthenticationCubit>().state as LoggedIn).user.id,
      );

      if (isClosed) {
        return;
      }

      if (gameStateModel.turnUser.isBot &&
          game.room.owner.id ==
              (GetIt.I.get<AuthenticationCubit>().state as LoggedIn).user.id) {
        playForBot(gameStateModel: gameStateModel);
      }

      emit(GameLoaded(
        game: game,
        gameStateModel: gameStateModel,
        userStates: userStates,
        userOptions: userOptions,
      ));
    });
  }

  void sendRollDice(
      {required int gameId,
      required int dice1,
      required int dice2,
      required String userId}) async {
    await _gameRepository.rollDice(
        gameId: gameId, dice1: dice1, dice2: dice2, userId: userId);
  }

  void endTurn({required int gameId, required String userId}) async {
    await _gameRepository.endTurn(gameId: gameId, userId: userId);
  }

  void buildRoad({
    required String userId,
    required int roadIndex,
  }) async {
    await _gameRepository.buildRoad(
        gameId: game.id, userId: userId, roadIndex: roadIndex);
  }

  void buildSettlement({
    required String userId,
    required int settlementIndex,
  }) async {
    await _gameRepository.buildSettlement(
        gameId: game.id, userId: userId, settlementIndex: settlementIndex);
  }

  void buildCity({
    required String userId,
    required int cityIndex,
  }) async {
    await _gameRepository.buildCity(
        gameId: game.id, userId: userId, cityIndex: cityIndex);
  }
}
