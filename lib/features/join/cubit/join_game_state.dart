part of 'join_game_cubit.dart';

sealed class JoinRoomState extends Equatable {
  const JoinRoomState();

  @override
  List<Object> get props => [];
}

final class JoinRoomInitial extends JoinRoomState {}

final class JoinRoomInProgress extends JoinRoomState {}

final class JoinRoomSuccess extends JoinRoomState {
  final int roomId;

  const JoinRoomSuccess({required this.roomId});

  @override
  List<Object> get props => [roomId];
}

final class JoinRoomFailure extends JoinRoomState {}
