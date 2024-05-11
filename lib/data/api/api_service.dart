
import 'package:dio/dio.dart';
import '../../models/User.dart';

class ApiService {

  static const API_BASE_URL = 'http://10.0.2.2:8000/api';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: API_BASE_URL),
  );

  Future register(Map<String, String> data) async {
    final response = await _dio.post(
      '/auth/register',
      data: data,
    );
    return response.data;
  }

  Future login(Map<String, String> data) async {
    final response = await _dio.post(
      '/auth/login',
      data: data,
    );
    return response.data;
  }

  Future logout() async {
    final response = await _dio.post(
      '/auth/logout',
    );
    return response.data;
  }

  Future checkAuth() async {
    final response = await _dio.get('/auth/checkAuth');
    return response.data;
  }




}