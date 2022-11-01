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
