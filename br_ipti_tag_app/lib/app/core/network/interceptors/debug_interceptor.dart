import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DebugInterceptor extends InterceptorsWrapper {
  String _formatJson(dynamic data) {
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint(
          '''==>> Sending ${options.method} to: ${options.path} - ${DateTime.now()}''');
      debugPrint("   |  Data: \n ${_formatJson(options.data)}");
      debugPrint("   |  Query Params: ${options.queryParameters}");
      debugPrint("=========================================================>>");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
          '''<<== Received [${response.statusCode}] from: ${response.realUri.path} - ${DateTime.now()}''');

      debugPrint("|  Data: ${_formatJson(response.data)}");
      debugPrint(
          '''<<=========================================== ${response.realUri.path}''');
    }

    super.onResponse(response, handler);
  }
}
