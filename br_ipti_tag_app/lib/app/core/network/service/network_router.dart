import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/paginated_response.dart';

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
