import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/features/lobby/models/room.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:catan_gui_flutter/repositories/room_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'lobby_state.dart';

class LobbyCubit extends Cubit<LobbyState> {
  final IGameRepository _gameRepository;
  final IRoomRepository _roomRepository;

  late Room room;

  Timer? timer;

  LobbyCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        _roomRepository = GetIt.I.get<IRoomRepository>(),
        super(LobbyCreating());

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

  void createRoomAndStartTimer({required String roomName}) async {
    emit(LobbyCreating());

    room = await _roomRepository.createRoom(name: roomName);
    emit(LobbyLoaded(room: room));

    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      room = await _roomRepository.getRoom(roomId: room.id);

      if (isClosed) {
        return;
      }
      emit(LobbyLoaded(
        room: room,
      ));

      if (room.gameStarted) {
        final game = await _gameRepository.getGameByRoomId(roomId: room.id);

        emit(GameCreated(gameId: game.id));
      }
    });
  }

  void joinRoomAndStartTimer({required int roomId}) async {
    emit(LobbyCreating());

    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      room = await _roomRepository.getRoom(roomId: roomId);

      if (isClosed) {
        return;
      }
      emit(LobbyLoaded(
        room: room,
      ));

      if (room.gameStarted) {
        final game = await _gameRepository.getGameByRoomId(roomId: room.id);

        emit(GameCreated(gameId: game.id));
      }
    });
  }

  void shuffleResourcesAndNumbers() async {
    room = await _roomRepository.shuffleResourcesAndNumbers(roomId: room.id);
    emit(LobbyLoaded(
      room: room,
    ));
  }

  void addBot() async {
    room = await _roomRepository.addBot(roomId: room.id);
    emit(LobbyLoaded(
      room: room,
    ));
  }

  void createGame() async {
    try {
      emit(GameCreating());
      await _gameRepository.createGame(roomId: room.id);
    } catch (e) {}
  }
}
