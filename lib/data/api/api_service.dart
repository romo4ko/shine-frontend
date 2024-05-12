
import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {

  static const API_BASE_URL = 'http://10.0.2.2:8000/api';

  var token;

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer ${token}'
  };

  final Dio _dio = Dio(
    BaseOptions(baseUrl: API_BASE_URL),
  );

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var storageToken = localStorage.getString('token');
    if (storageToken != null) {
      token = jsonDecode(storageToken);
    }
  }

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
    await _getToken();
    final response = await _dio.post(
      '/auth/logout',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future updateUserProperties(Map<String, String> data) async {
    await _getToken();
    final response = await _dio.post(
      '/users/updateProperties',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    print(token);
    return response.data;
  }

  Future storeUserProperties(Map<String, String> data) async {
    await _getToken();
    final response = await _dio.post(
      '/users/storeProperties',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future storeImage(dynamic data) async {
    await _getToken();
    final formData = FormData.fromMap(data);

    final response = await _dio.post(
      '/users/images/store',
      data: formData,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

}