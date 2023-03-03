
import 'package:br_ipti_appbase/core/auth_interceptor.dart';
import 'package:br_ipti_appbase/core/config/enviroment.dart';
import 'package:br_ipti_appbase/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_appbase/core/network/interceptors/guard_token_interceptor.dart';
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