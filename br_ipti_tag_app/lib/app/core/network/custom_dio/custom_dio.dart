import 'package:br_ipti_tag_app/app/core/network/interceptors/auth_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/debug_interceptor.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// ignore: avoid_classes_with_only_static_members
class ClientHTTPConfiguration {
  static Dio apply(Dio client) {
    if (kDebugMode) client.interceptors.add(DebugInterceptor());
    client.interceptors.add(AuthInterceptor());
    client.interceptors.add(ErrorInterceptor());

    client.options.baseUrl =
        "http://ec2-3-230-55-29.compute-1.amazonaws.com:3000";
    return client;
  }
}
