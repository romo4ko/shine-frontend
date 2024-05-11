
import 'package:dio/dio.dart';
import '../../models/User.dart';

class ApiService {

  static const API_BASE_URL = 'http://10.0.2.2:8000/api';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: API_BASE_URL),
  );

  Future register({
    required String email,
    required String password,
    required String birthdate,
  }) async {
    final data = {
      'email': email,
      'password': password,
      'birthdate': birthdate,
    };
    final response = await _dio.post(
      '/auth/register',
      data: data,
    );
    return response.data;
  }

  void checkAuth() async {
    final response = await _dio.get('/auth/checkAuth');
    return response.data;
  }
}