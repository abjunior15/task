import 'package:dio/dio.dart';

extension OnDioException on DioException {
  String getErrorMessage() {
    if (response != null) {
      if (response!.data is Map) {
        return response!.data['message'];
      }
    }
    return message ?? 'An error occurred';
  }

  int getErrorCode() {
    return response?.statusCode ?? -1;
  }

  String getCustomMessage() {
    if (response != null) {
      switch (response!.statusCode) {
        case 400:
          return 'Bad request';
        case 401:
          return 'Invalid credentials';
        case 402:
          return 'Payment required';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Not found';
        case 405:
          return 'Method not allowed';
        case 406:
          return 'Not acceptable';
        case 407:
          return 'Proxy authentication required';
        case 408:
          return 'Request timeout';
        default:
          return 'An error occurred';
      }
    }
    switch (type) {
      case DioExceptionType.cancel:
        return 'Request to API was cancelled';
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API';
      case DioExceptionType.sendTimeout:
        return 'Send data timeout with API';
      case DioExceptionType.receiveTimeout:
        return 'Receive data timeout with API';
      case DioExceptionType.badResponse:
        return 'Received invalid status code: ${response?.statusCode}';
      case DioExceptionType.connectionError:
        return 'An error occurred';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      default:
        return 'An error occurred';
    }
  }
}
