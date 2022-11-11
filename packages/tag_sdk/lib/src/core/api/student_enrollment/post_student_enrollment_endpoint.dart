import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/data/models/student_enrollment_model.dart';

class PostStudentEnrollmentEndPoint extends EndPointAPI {
  PostStudentEnrollmentEndPoint({
    required this.model,
  });

  final StudentEnrollmentModel model;

  @override
  String get path => '/studentEnrollment';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
