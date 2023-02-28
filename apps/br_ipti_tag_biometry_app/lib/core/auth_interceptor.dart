import 'package:dio/dio.dart';
import 'package:tag_sdk/tag_sdk.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final sessionService = AuthLocalDataSourceImpl();
      final token = await sessionService.getToken();
      options.headers['Authorization'] = 'Bearer $token';

      return super.onRequest(options, handler);
    } catch (e) {
      return super.onRequest(options, handler);
    }
  }
}
