import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class GetSchoolEndPoint extends EndPointAPI {
  final String schoolId;
  GetSchoolEndPoint(this.schoolId);

  @override
  String get path => "/school/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  HTTPHeaders? get headers => null;

  @override
  Parameters? get bodyParameters => null;

  @override
  Parameters? get urlParameters => null;
}
