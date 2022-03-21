import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';

class GetInstructorsEndPoint extends EndPointAPI {
  final ListInstructorsParams instructorQuery;
  GetInstructorsEndPoint(this.instructorQuery);

  @override
  String get path => '/instructor';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => instructorQuery.toJson;
}
