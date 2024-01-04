import 'package:catan_gui_flutter/models/user.dart';

class UserWithPoints {
  final User user;
  final double points;

  const UserWithPoints({
    required this.user,
    required this.points,
  });

  static UserWithPoints fromJson(Map<String, dynamic> json) {
    return UserWithPoints(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      points: (json['points'] as num).toDouble(),
    );
  }
}
