import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_enrollment_model.dart';

class PutStudentEnrollmentEndPoint extends EndPointAPI {
  PutStudentEnrollmentEndPoint({
    required this.id,
    required this.model,
  });

  final String id;
  final StudentEnrollmentModel model;

  @override
  String get path => '/studentEnrollment/$id';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
