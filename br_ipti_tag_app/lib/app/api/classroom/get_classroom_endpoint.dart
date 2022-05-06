import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';

class GetClassroomEndPoint extends EndPointAPI {
  final ClassroomParams classroomParams;
  GetClassroomEndPoint(this.classroomParams);

  @override
  String get path => '/classroom';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => classroomParams.toJson;
}
