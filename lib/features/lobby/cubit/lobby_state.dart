part of 'lobby_cubit.dart';

sealed class LobbyState extends Equatable {
  const LobbyState();

  @override
  List<Object> get props => [];
}

final class LobbyInitial extends LobbyState {}

final class WaitCreatingGame extends LobbyState {}

final class GameCreated extends LobbyState {
  final int gameId;

  const GameCreated(this.gameId);

  @override
  List<Object> get props => [gameId];
}

final class GameCreatingError extends LobbyState {}
