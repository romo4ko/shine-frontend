
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';

class ApiService {

  static String API_BASE_URL = kDebugMode
      ? AppConfig.config['API']!['BaseUrl']['Debug']
      : AppConfig.config['API']!['BaseUrl']['Release'];

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

  // ##### AUTH #####

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

  Future checkAuth() async {
    await _getToken();
    final response = await _dio.get(
      '/auth/check',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### USER #####

  Future getCurrentUser() async {
    await _getToken();
    final response = await _dio.get(
      '/users/me',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future updateUserProperties(Map<String, dynamic> data) async {
    await _getToken();
    final response = await _dio.post(
      '/users/updateProperties',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future updateUserSettings(Map<String, dynamic> data) async {
    await _getToken();
    final response = await _dio.post(
      '/users/updateSettings',
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

  Future getFilter() async {
    await _getToken();
    final response = await _dio.get(
      '/users/filter/get',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future setFilter(dynamic data) async {
    await _getToken();
    final response = await _dio.post(
      '/users/filter/set',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future sendConfirmationEmail() async {
    await _getToken();
    final response = await _dio.post(
      '/users//email/verify',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### USERS #####

  Future getUsers() async {
    await _getToken();
    final response = await _dio.get(
      '/users/list',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future deleteUser() async {
    await _getToken();
    final response = await _dio.post(
      '/users/delete',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### LIKES #####

  Future like(Map<String, int> data) async {
    await _getToken();
    final response = await _dio.post(
      '/likes/set',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future revokeLike(Map<String, int> data) async {
    await _getToken();
    final response = await _dio.post(
      '/likes/revoke',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future confirmLike(Map<String, int> data) async {
    await _getToken();
    final response = await _dio.post(
      '/likes/confirm',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future likes() async {
    await _getToken();
    final response = await _dio.get(
      '/likes/list',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### CHAT #####

  Future chats() async {
    await _getToken();
    final response = await _dio.get(
      '/chats/list',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future chat(Map<String, int> data) async {
    await _getToken();
    final response = await _dio.get(
      '/chats/chat',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future sendMessage(Map<String, dynamic> data) async {
    await _getToken();
    final formData = FormData.fromMap(data);
    final response = await _dio.post(
      '/message/send',
      data: formData,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future requestMessage(Map<String, dynamic> data) async {
    await _getToken();
    final response = await _dio.post(
      '/message/request',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### CITIES #####

  Future cities(Map<String, String> input) async {
    await _getToken();
    final response = await _dio.get(
      '/cities',
      data: input,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  // ##### PREDICTIONS #####

  Future prediction() async {
    await _getToken();
    final response = await _dio.get(
      '/prediction/get',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future support(Map<String, dynamic> data) async {
    await _getToken();
    final response = await _dio.post(
      '/support/create',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future document(Map<String, String> data) async {
    await _getToken();
    final response = await _dio.get(
      '/document',
      data: data,
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

  Future getPrices() async {
    await _getToken();
    final response = await _dio.get(
      '/users/premium/prices',
      options: Options(headers: _setHeaders()),
    );
    return response.data;
  }

}

