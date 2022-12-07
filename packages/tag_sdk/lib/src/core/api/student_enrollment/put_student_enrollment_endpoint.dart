import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

class PutStudentEnrollmentEndPoint extends EndPointAPI {
  PutStudentEnrollmentEndPoint({
    required this.id,
    required this.model,
  });

  final int id;
  final StudentEnrollment model;

  @override
  String get path => '/Classroom/$id';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
