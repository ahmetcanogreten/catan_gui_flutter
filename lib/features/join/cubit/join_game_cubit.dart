import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/repositories/room_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'join_game_state.dart';

class JoinRoomCubit extends Cubit<JoinRoomState> {
  final IRoomRepository _roomRepository;
  JoinRoomCubit()
      : _roomRepository = GetIt.I.get<IRoomRepository>(),
        super(JoinRoomInitial());

  void joinGame({required String roomCode}) async {
    try {
      emit(JoinRoomInProgress());

      final room = await _roomRepository.joinRoom(roomCode: roomCode);

      emit(JoinRoomSuccess(roomId: room.id));
    } catch (e) {
      emit(JoinRoomFailure());
    }
  }
}
