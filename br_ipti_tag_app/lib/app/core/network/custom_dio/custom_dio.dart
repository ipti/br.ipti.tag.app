import 'package:br_ipti_tag_app/app/core/config/enviroment.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/auth_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/debug_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:dio/dio.dart';

// ignore: avoid_classes_with_only_static_members
class ClientHTTPConfiguration {
  static Dio apply(Dio client) {
    // if (Environment().config.debugRequests) {
    client.interceptors.add(DebugInterceptor());
    // }
    client.interceptors.add(AuthInterceptor());
    client.interceptors.add(ErrorInterceptor());

    client.options.baseUrl = Environment().config.apiHost;
    return client;
  }
}
