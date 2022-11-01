import 'package:dio/dio.dart';
import 'package:tag_network/src/network/endpoint/endpoint.dart';
import 'package:tag_network/src/network/service/paginated_response.dart';

import 'network_response.dart';
import 'network_router.dart';

class RouterAPI implements NetworkRouter {
  RouterAPI(this._client);

  final Dio _client;

  @override
  Future<NetworkResponse<Map<String, dynamic>>> request({
    required EndPointAPI route,
  }) async {
    try {
      final requestOptions = _buildRequest(route: route);
      final response = await _client.fetch(requestOptions);

      return NetworkResponse(
        response.data as Map<String, dynamic>,
        response,
        null,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse<Iterable>> requestListFrom({
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

  @override
  Future<NetworkResponse<PaginatedResponse>> requestListPaginatedFrom({
    required EndPointAPI route,
  }) async {
    final requestOptions = _buildRequest(route: route);
    final response = await _client.fetch(requestOptions);

    return NetworkResponse(
      PaginatedResponse.fromMap(response.data as Map<String, dynamic>),
      response,
      null,
    );
  }

  RequestOptions _buildRequest({
    required EndPointAPI route,
  }) {
    final headers = _client.options.headers;
    final Map<String, dynamic> queryParameters = {};
    final data = {};

    if (route.headers != null) {
      headers.addAll(
        route.headers!(),
      );
    }

    if (route.urlParameters != null) {
      queryParameters.addAll(
        route.urlParameters!(),
      );
    }

    if (route.bodyParameters != null) {
      data.addAll(
        route.bodyParameters!(),
      );
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
