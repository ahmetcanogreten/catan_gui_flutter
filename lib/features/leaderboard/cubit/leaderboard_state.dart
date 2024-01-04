part of 'leaderboard_cubit.dart';

sealed class LeaderboardState extends Equatable {
  const LeaderboardState();

  @override
  List<Object> get props => [];
}

final class LeaderboardInitial extends LeaderboardState {}

final class LeaderboardLoading extends LeaderboardState {}

final class LeaderboardLoaded extends LeaderboardState {
  final PaginatedUserWithPoints paginatedUsersWithPoints;

  const LeaderboardLoaded({required this.paginatedUsersWithPoints});

  @override
  List<Object> get props => [paginatedUsersWithPoints];
}

final class LeaderboardError extends LeaderboardState {}
