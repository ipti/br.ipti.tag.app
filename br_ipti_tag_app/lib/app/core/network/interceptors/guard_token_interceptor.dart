import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

const DEFAULT_ERROR = "Erro não mapeado";
const API_HTTP_INTERNAL_ERROR = "Erro interno do servidor";
const API_HTTP_UNAVAILABLE = "Servidor não disponível";
const CONNECTION_TIMEOUT = "Fim do tempo de conexão";
const HTTP_NOT_FOUND_ERROR = "Recurso não encontrado no servidor";
const HTTP_UNAUTHORIZED = "Não autorizado, atualize suas credenciais";

class GuardTokenInterceptor extends InterceptorsWrapper {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    final sessionService = SessionServiceImpl();
    if (err.response!.statusCode == 401) {
      if (!Modular.to.path.contains('auth')) {
        sessionService.cleanToken();
        sessionService.cleanSchoolYear();
        sessionService.cleanCurrentUserSchools();
        sessionService.cleanCurrentSchool();
        Modular.to.pushReplacementNamed('/auth');
      }
    }
  }
}
