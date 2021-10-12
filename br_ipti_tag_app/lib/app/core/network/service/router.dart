import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:dio/dio.dart';

import '../manager/http_method.dart';
import 'network_router.dart';

class RouterAPI implements NetworkRouter {
  RouterAPI(this._client);

  final Dio _client;

  @override
  Future<NetworkResponse<Map<String, dynamic>>> request({
    required EndPointAPI route,
  }) async {
    final requestOptions = _buildRequest(route: route);
    final response = await _client.fetch(requestOptions);

    return NetworkResponse(
      response.data as Map<String, dynamic>,
      response,
      null,
    );
  }

  @override
  Future<NetworkResponse<Iterable>> requestListOf({
    required EndPointAPI route,
  }) async {
    try {
      final requestOptions = _buildRequest(route: route);
      final response = await _client.fetch(requestOptions);
      return NetworkResponse(
        response.data as Iterable,
        response,
        null,
      );
    } catch (e) {
      return NetworkResponse(
        [],
        null,
        Exception(
          "Não foi possível executar consulta, servidor indisponível\n $e",
        ),
      );
    }
  }

  RequestOptions _buildRequest({
    required EndPointAPI route,
  }) {
    final headers = _client.options.headers;
    final queryParameters = _client.options.queryParameters;
    final data = {};

    if (route.headers != null) {
      headers.addAll(route.headers!());
    }

    if (route.urlParameters != null) {
      queryParameters.addAll(route.urlParameters!());
    }

    if (route.bodyParameters != null) {
      data.addAll(route.bodyParameters!());
    }

    final request = RequestOptions(
      path: route.path,
      method: route.httpMethod.name,
      responseType: ResponseType.json,
      baseUrl: _client.options.baseUrl,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
    );

    return request;
  }
}
