part of 'lobby_cubit.dart';

sealed class LobbyState extends Equatable {
  const LobbyState();

  @override
  List<Object> get props => [];
}

final class LobbyCreating extends LobbyState {}

final class LobbyLoaded extends LobbyState {
  final Room room;

  const LobbyLoaded({required this.room});

  @override
  List<Object> get props => [room];
}

final class GameCreating extends LobbyState {}

final class GameCreated extends LobbyState {
  final int gameId;

  const GameCreated({required this.gameId});

  @override
  List<Object> get props => [gameId];
}

final class GameCreatingError extends LobbyState {}
