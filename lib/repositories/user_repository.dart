import 'package:catan_gui_flutter/models/user.dart';

abstract class IUserRepository {
  Future<User> login({
    required String email,
    required String password,
  });

  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}

class MockUserRepository implements IUserRepository {
  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', firstName: 'John', lastName: 'Doe', email: email);
  }

  @override
  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
        id: '1', firstName: firstName, lastName: lastName, email: email);
  }
}
