import 'package:br_ipti_tag_app/app/core/config/enviroment.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/auth_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/guard_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// ignore: avoid_classes_with_only_static_members
class ClientHTTPConfiguration {
  static Dio apply(Dio client) {
    if (Environment().config.debugRequests) {
      client.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
    client.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90),);
    client.interceptors.add(
      GuardTokenInterceptor(),
    );
    client.interceptors.add(
      AuthInterceptor(),
    );
    client.interceptors.add(
      ErrorInterceptor(),
    );

    client.options.baseUrl = Environment().config.apiHost;

    return client;
  }
}
