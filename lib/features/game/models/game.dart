import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/features/lobby/models/room.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final List<Resource> resources;
  final List<User> users;
  final List<String> usersCycle;
  final Room room;

  const Game({
    required this.id,
    required this.startedAt,
    this.finishedAt,
    required this.resources,
    required this.users,
    required this.usersCycle,
    required this.room,
  });

  @override
  List<Object?> get props => [
        id,
        startedAt,
        finishedAt,
        resources,
        users,
        usersCycle,
        room,
      ];

  Game copyWith({
    int? id,
    DateTime? startedAt,
    DateTime? finishedAt,
    List<Resource>? resources,
    List<User>? users,
    List<String>? usersCycle,
  }) {
    return Game(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      resources: resources ?? this.resources,
      users: users ?? this.users,
      usersCycle: usersCycle ?? this.usersCycle,
      room: room,
    );
  }

  static Game fromJson(Map<String, dynamic> json) {
    return Game(
        id: json['id'] as int,
        startedAt: DateTime.parse(json['startedAt'] as String),
        finishedAt: json['finishedAt'] == null
            ? null
            : DateTime.parse(json['finishedAt'] as String),
        resources: (json['resources'] as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
        users: (json['users'] as List<dynamic>)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        usersCycle: (json['usersCycle'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        room: Room.fromJson(json['room'] as Map<String, dynamic>));
  }
}
