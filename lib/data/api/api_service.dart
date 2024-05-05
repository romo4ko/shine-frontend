
import 'package:dio/dio.dart';
import '../../models/User.dart';

class ApiService {

  static const API_BASE_URL = 'http://79.174.82.139:8000/api';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: API_BASE_URL),
  );

  Future register({
    required String email,
    required String password,
    required String birthdate,
  }) async {
    final query = {
      'email': 'test@mail.com',
      'password': '12345678',
      'birthdate': '23.04.2002',
    };
    final response = await _dio.post(
      '/register',
      queryParameters: query,
    );
    return response.data;
  }

  void getHttp() async {
    final response = await _dio.get('/checkAuth');
    print(response);
  }
}