import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
    try {
      final sessionService = SessionServiceImpl();
      final token = await sessionService.getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return super.onRequest(options, handler);
    } catch (e) {
      return super.onRequest(options, handler);
    }
  }
}
