import 'dart:convert';

import 'package:catan_gui_flutter/api/api_client.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:dio/dio.dart';

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

class BackendUserRepository implements IUserRepository {
  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    apiClient.options.headers['Authorization'] =
        "Basic ${base64Encode(utf8.encode('$email:$password'))}";

    final response = await apiClient.get('/api/user/login');

    final data = response.data as Map<String, dynamic>;
    return User.fromJson(data);
  }

  @override
  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await Dio()
        .post('${apiClient.options.baseUrl}/api/user/register', data: {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    });
    final data = response.data as Map<String, dynamic>;

    apiClient.options.headers['Authorization'] =
        "Basic ${base64Encode(utf8.encode('$email:$password'))}";
    return User.fromJson(data);
  }
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
