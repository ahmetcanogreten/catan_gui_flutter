import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/models/paginated_user_with_points.dart';
import 'package:catan_gui_flutter/models/user_with_points.dart';
import 'package:catan_gui_flutter/repositories/leaderboard_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final ILeaderboardRepository _leaderboardRepository;

  LeaderboardCubit()
      : _leaderboardRepository = GetIt.I.get<ILeaderboardRepository>(),
        super(LeaderboardInitial());

  void getLeaderboard({
    required DateTime startDate,
    required DateTime endDate,
    required int pageSize,
    required int pageNo,
  }) async {
    try {
      emit(LeaderboardLoading());

      final userWithPoints = await _leaderboardRepository.getLeaderboard(
        startDate: startDate,
        endDate: endDate,
        pageSize: pageSize,
        pageNo: pageNo,
      );

      emit(LeaderboardLoaded(paginatedUsersWithPoints: userWithPoints));
    } catch (e) {
      emit(LeaderboardError());
    }
  }
}
