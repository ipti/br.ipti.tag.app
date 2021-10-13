import 'package:br_ipti_tag_app/app/features/login/data/datasources/local/auth_local_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
      final authRepository = AuthLocalDataSourceImpl();
      final authToken = await authRepository.getAuthToken();
      options.headers['Authorization'] = 'Bearer ${authToken.accessToken}';
      return super.onRequest(options, handler);
    } catch (e) {
      return super.onRequest(options, handler);
    }
  }
}
