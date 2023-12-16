import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/features/game/models/game.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final IGameRepository _gameRepository;

  late final Game game;

  GameCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(GameInitial());

  void startGetGameStateTimer({required int gameId}) async {
    try {
      emit(GameLoading());

      game = await _gameRepository.getGame(gameId: gameId);

      Timer.periodic(const Duration(seconds: 1), (timer) async {
        final latestGameState = await _gameRepository.getGameState(
          gameId: gameId,
        );

        emit(GameLoaded(
          game: game.copyWith(
            gameState: latestGameState,
          ),
        ));
      });
    } catch (e) {
      // TODO: handle exception
    }
  }
}
