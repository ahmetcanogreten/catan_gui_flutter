import 'package:catan_gui_flutter/api/api_client.dart';
import 'package:catan_gui_flutter/models/paginated_user_with_points.dart';
import 'package:catan_gui_flutter/models/user_with_points.dart';

abstract class ILeaderboardRepository {
  Future<PaginatedUserWithPoints> getLeaderboard({
    required DateTime startDate,
    required DateTime endDate,
    required int pageSize,
    required int pageNo,
  });
}

class BackendLeaderboardRepository implements ILeaderboardRepository {
  @override
  Future<PaginatedUserWithPoints> getLeaderboard({
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

    final total = data['totalElements'] as int;

    return PaginatedUserWithPoints(users: userWithPoints, total: total);
  }
}
