import 'dart:async';

import 'package:dio/dio.dart';
import '../../common/constants/api.dart';
import '../../common/constants/exceptions.dart';

import '../shared_prefs_repo.dart';

enum RequestType {
  post,
  get,
  delete,
  put,
  patch,
}

class RequestClient {
  final SharedPrefsRepository _sharedPrefsRepository;

  RequestClient({
    required SharedPrefsRepository sharedPrefsRepository,
  }) : _sharedPrefsRepository = sharedPrefsRepository;

  final Dio dio = Dio();

  Future<Map<String, String>> getHeaders() async {
    String? token = _sharedPrefsRepository.getToken();

    var data = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    if (token != null) {
      data["Authorization"] = "Bearer $token";
    }

    return data;
  }

  Future<Response> post({required String endpoint, body}) async {
    try {
      final response = await dio.post(EnvironmentConfigs.baseUrl + endpoint,
          data: body,
          options: Options(
            headers: await getHeaders(),
            contentType: 'application/json',
          ));

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException('The connection has timed out!');
      }
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    }
  }

  Future<Response> get(
      {required String endpoint, Map<String, String>? body}) async {
    try {
      final response = await dio.get(EnvironmentConfigs.baseUrl + endpoint,
          options: Options(
            headers: await getHeaders(),
            contentType: 'application/json',
          ));

      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    }
  }

  Future<Response> delete({required String endpoint, body}) async {
    try {
      final response = await dio.delete(EnvironmentConfigs.baseUrl + endpoint,
          data: body,
          options: Options(
            headers: await getHeaders(),
            contentType: 'application/json',
          ));

      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    }
  }

  Future<Response> put({
    required String endpoint,
    body,
  }) async {
    try {
      final response = await dio.put(
        EnvironmentConfigs.baseUrl + endpoint,
        data: body,
        options: Options(
          headers: await getHeaders(),
          contentType: 'application/json',
        ),
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    }
  }

  Future<Response> patch({
    required String endpoint,
    body,
  }) async {
    try {
      final response = await dio.patch(
        EnvironmentConfigs.baseUrl + endpoint,
        data: body,
        options: Options(
          headers: await getHeaders(),
          contentType: 'application/json',
        ),
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    }
  }
}
