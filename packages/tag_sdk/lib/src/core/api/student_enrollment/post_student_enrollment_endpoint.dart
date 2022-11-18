import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

class PostStudentEnrollmentEndPoint extends EndPointAPI {
  PostStudentEnrollmentEndPoint({
    required this.model,
  });

  final StudentEnrollment model;

  @override
  String get path => '/Classroom';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
