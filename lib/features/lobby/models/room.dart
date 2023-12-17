import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final int id;
  final String name;
  final String code;
  final List<User> users;
  final User owner;
  final List<Resource> resources;
  final bool gameStarted;

  const Room({
    required this.id,
    required this.name,
    required this.code,
    required this.users,
    required this.owner,
    required this.resources,
    required this.gameStarted,
  });

  @override
  List<Object> get props =>
      [id, name, code, owner, users, resources, gameStarted];

  Room copyWith({
    int? id,
    String? name,
    String? code,
    List<User>? users,
    User? owner,
    List<Resource>? resources,
    bool? gameStarted,
  }) {
    return Room(
      id: id ?? this.id,
      users: users ?? this.users,
      name: name ?? this.name,
      code: code ?? this.code,
      owner: owner ?? this.owner,
      resources: resources ?? this.resources,
      gameStarted: gameStarted ?? this.gameStarted,
    );
  }

  static Room fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      resources: (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameStarted: json['gameStarted'] as bool,
    );
  }
}
