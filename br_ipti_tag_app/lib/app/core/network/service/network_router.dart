import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:dio/dio.dart';

class NetworkResponse<T> {
  NetworkResponse(this.data, this.response, this.error);

  final T? data;
  final Response? response;
  final Exception? error;

  @override
  String toString() {
    return "Message : $error \n Data : $data";
  }
}

abstract class NetworkRouter {
  Future<NetworkResponse> request({
    required EndPointAPI route,
  });
  Future<NetworkResponse> requestListOf({
    required EndPointAPI route,
  });
}
