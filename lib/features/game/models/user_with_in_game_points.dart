import 'package:equatable/equatable.dart';

class UserWithInGamePoints extends Equatable {
  final String id;
  final int points;

  const UserWithInGamePoints({
    required this.id,
    required this.points,
  });

  @override
  List<Object?> get props => [id, points];

  static UserWithInGamePoints fromJson(Map<String, dynamic> json) {
    return UserWithInGamePoints(
      id: json['id'],
      points: json['points'],
    );
  }
}
