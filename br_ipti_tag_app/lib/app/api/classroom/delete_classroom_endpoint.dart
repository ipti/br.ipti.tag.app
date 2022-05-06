import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class DeleteClasroomEndPoint extends EndPointAPI {
  DeleteClasroomEndPoint(
    this.id,
  );

  String id;

  @override
  String get path => '/classroom/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.DELETE;

  @override
  Parameters? get urlParameters => null;
}
