part of 'game_cubit.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {}

final class GameLoading extends GameState {}

final class GameLoaded extends GameState {
  final Game game;
  final GameStateModel gameStateModel;
  final List<UserState> userStates;

  const GameLoaded(
      {required this.game,
      required this.gameStateModel,
      required this.userStates});

  @override
  List<Object> get props => [game, gameStateModel, userStates];
}
