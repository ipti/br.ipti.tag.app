import 'dart:io';

import 'package:dio/dio.dart';

const DEFAULT_ERROR = "Erro não mapeado";
const API_HTTP_INTERNAL_ERROR = "Erro interno do servidor";
const API_HTTP_UNAVAILABLE = "Servidor não disponível";
const CONNECTION_TIMEOUT = "Fim do tempo de conexão";
const HTTP_NOT_FOUND_ERROR = "Recurso não encontrado no servidor";
const HTTP_UNAUTHORIZED = "Não autorizado, verifique suas credenciais";

class RestClientException extends DioError {
  RestClientException(DioError e)
      : super(
          requestOptions: e.requestOptions,
          response: e.response,
          error: e.error,
          type: e.type,
        );

  String handledError() {
    if ([
      DioErrorType.connectTimeout,
      DioErrorType.sendTimeout,
    ].contains(type)) {
      return 'Connection Timeout';
    }

    if (response?.statusCode == null) {
      return 'NETWORK_CONNECTION_ERROR';
    }

    switch (response?.statusCode) {
      case HttpStatus.internalServerError:
        return API_HTTP_INTERNAL_ERROR;
      case HttpStatus.serviceUnavailable:
        return API_HTTP_UNAVAILABLE;
      case HttpStatus.gatewayTimeout:
        return CONNECTION_TIMEOUT;
      case HttpStatus.notFound:
        return HTTP_NOT_FOUND_ERROR;
      case HttpStatus.unauthorized:
        return HTTP_UNAUTHORIZED;
      default:
        if (response!.data is Map) {
          final data = response!.data as Map;

          return data['error_description'] as String? ?? DEFAULT_ERROR;
        }
        if (response!.statusMessage?.isNotEmpty == true) {
          return response!.statusMessage ?? DEFAULT_ERROR;
        }

        return "Erro não mapeado ${response?.statusCode ?? 'Sem código'}";
    }
  }
}
