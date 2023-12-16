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

  Timer? _timer;

  GameCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(GameInitial());

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void startGetGameStateTimer({required int gameId}) async {
    emit(GameLoading());

    game = await _gameRepository.getGame(gameId: gameId);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final latestGameState = await _gameRepository.getGameState(
        gameId: gameId,
      );

      if (isClosed) {
        return;
      }

      emit(GameLoaded(
        game: game.copyWith(
          gameState: latestGameState,
        ),
      ));
    });
  }
}
