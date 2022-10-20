import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class GetStudentsEndPoint extends EndPointAPI {
  GetStudentsEndPoint({this.id, required this.schoolId});

  final String? id;
  final String schoolId;

  @override
  String get path =>
      id == null ? '/student-identification' : '/student-identification/$id';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => () => {
        // "school": schoolId,
        "perPage": 1000,
      };
}
