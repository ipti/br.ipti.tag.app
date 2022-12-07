import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint(err.message);
    }

    if (err.response != null && err.response!.statusCode == 401) {
      if (!Modular.to.path.contains('auth')) {
        final sessionService = SessionServiceImpl();
        sessionService.cleanToken();
        sessionService.cleanSchoolYear();
        sessionService.cleanCurrentUserSchools();
        sessionService.cleanCurrentSchool();
        Modular.to.pushReplacementNamed('/');
      }

      log(
        err.response?.data.toString() ?? err.message,
        stackTrace: err.stackTrace,
        error: err.error,
      );
    }

    // super.onError(RestClientException(err), handler);

    return handler.next(RestClientException(err));
  }
}
