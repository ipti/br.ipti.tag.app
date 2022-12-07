import 'package:tag_network/src/network/endpoint/endpoint.dart';
import 'package:tag_network/src/network/service/paginated_response.dart';

import 'network_response.dart';

abstract class NetworkRouter {
  Future<NetworkResponse> request({
    required EndPointAPI route,
  });
  Future<NetworkResponse<Iterable>> requestListFrom({
    required EndPointAPI route,
  });

  Future<NetworkResponse<PaginatedResponse>> requestListPaginatedFrom({
    required EndPointAPI route,
  });
}
