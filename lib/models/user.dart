import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isBot;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isBot,
  });

  @override
  List<Object> get props => [id, firstName, lastName, email];

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      isBot: json['bot'],
    );
  }
}
