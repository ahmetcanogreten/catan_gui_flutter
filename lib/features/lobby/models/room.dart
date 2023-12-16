import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final int id;
  final List<User> users;
  final User owner;
  final List<Resource> resources;

  const Room(
      {required this.id,
      required this.users,
      required this.owner,
      required this.resources});

  @override
  List<Object> get props => [id, users, owner, resources];

  Room copyWith({
    int? id,
    List<User>? users,
    User? owner,
    List<Resource>? resources,
  }) {
    return Room(
      id: id ?? this.id,
      users: users ?? this.users,
      owner: owner ?? this.owner,
      resources: resources ?? this.resources,
    );
  }
}
