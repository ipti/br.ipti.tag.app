import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class GetEdcensoUfEndPoint extends EndPointAPI {
  GetEdcensoUfEndPoint({
    this.id,
  });

  final String? id;

  @override
  String get path => id == null ? '/edcensoUf' : '/edcensoUf/{$id}';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
