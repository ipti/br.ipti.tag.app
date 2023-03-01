
import 'package:br_ipti_appbase/core/plataform/session_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GuardTokenInterceptor extends InterceptorsWrapper {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    final sessionService = SessionServiceImpl();
    if (err.response != null && err.response!.statusCode == 401) {
      if (!Modular.to.path.contains('auth')) {
        sessionService.cleanToken();
        sessionService.cleanSchoolYear();
        sessionService.cleanCurrentUserSchools();
        sessionService.cleanCurrentSchool();
        Modular.to.pushReplacementNamed('/');
      }
    }
    super.onError(err, handler);
  }
}
