import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const authToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTVlZTZlY2RjZDJkMjQ0NTQwMTkxMzYiLCJpYXQiOjE2MzM5OTk3NTksImV4cCI6MTYzNDAwNjk1OX0.uK9Q0zI25-isQ__K6gUfo6n2gqiuEVdKxYDNmZ2wQYw";

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint("BaseURL: ${options.baseUrl}");
      debugPrint("Endpoint: ${options.path}");
    }

    options.headers['Authorization'] = 'Bearer $authToken';

    return super.onRequest(options, handler);
  }
}
