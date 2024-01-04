import 'package:catan_gui_flutter/api/api_client.dart';
import 'package:catan_gui_flutter/models/user_with_points.dart';

abstract class ILeaderboardRepository {
  Future<List<UserWithPoints>> getLeaderboard({
    required DateTime startDate,
    required DateTime endDate,
    required int pageSize,
    required int pageNo,
  });
}

class BackendLeaderboardRepository implements ILeaderboardRepository {
  @override
  Future<List<UserWithPoints>> getLeaderboard({
    required DateTime startDate,
    required DateTime endDate,
    required int pageSize,
    required int pageNo,
  }) async {
    final response = await apiClient.get(
      '/api/leaderboard',
      queryParameters: {
        'startDate': startDate.toUtc().toIso8601String(),
        'endDate': endDate.toUtc().toIso8601String(),
        'pageSize': pageSize,
        'pageNo': pageNo,
      },
    );

    final data = response.data as Map;

    final userWithPoints = (data['content'] as List)
        .map((e) => UserWithPoints.fromJson(e))
        .toList();

    return userWithPoints;
  }
}
