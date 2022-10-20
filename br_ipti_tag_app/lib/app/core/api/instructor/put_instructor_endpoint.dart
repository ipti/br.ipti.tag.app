import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/teacher/data/models/instructor_model.dart';

class PutInstructorEndPoint extends EndPointAPI {
  PutInstructorEndPoint({
    required this.objectId,
    required this.model,
  });

  final InstructorModel model;
  final String objectId;

  @override
  String get path => '/instructor/$objectId';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
