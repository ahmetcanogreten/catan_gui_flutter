import 'package:catan_gui_flutter/models/user_with_points.dart';

class PaginatedUserWithPoints {
  final List<UserWithPoints> users;
  final int total;

  PaginatedUserWithPoints({
    required this.users,
    required this.total,
  });

  factory PaginatedUserWithPoints.fromJson(Map<String, dynamic> json) {
    return PaginatedUserWithPoints(
      users: (json['users'] as List)
          .map((user) => UserWithPoints.fromJson(user))
          .toList(),
      total: json['total'],
    );
  }
}
