import 'package:dio/dio.dart';

final apiClient = Dio(BaseOptions(
  baseUrl: 'http://localhost:8080',
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  },
));
