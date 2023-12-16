import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'lobby_state.dart';

class LobbyCubit extends Cubit<LobbyState> {
  final IGameRepository _gameRepository;
  LobbyCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(LobbyInitial());

  void createGame({
    required List<ResourceType> resourceTypes,
    required List<int> numbers,
    required int numberOfBots,
  }) async {
    try {
      emit(WaitCreatingGame());

      List<Resource> resources = [];

      for (var i = 0; i < numbers.length; i++) {
        resources.add(Resource(
          index: i,
          type: resourceTypes[i],
          number: numbers[i],
        ));
      }

      await _gameRepository.createGame(
        resources: resources,
        numberOfBots: numberOfBots,
      );

      emit(const GameCreated(1));
    } catch (e) {
      emit(GameCreatingError());
    }
  }
}
