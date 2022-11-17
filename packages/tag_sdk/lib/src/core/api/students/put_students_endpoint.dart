import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

class PutStudentsEndPoint extends EndPointAPI {
  PutStudentsEndPoint({
    required this.id,
    required this.model,
  });

  final int id;
  final StudentIdentification model;

  @override
  String get path => '/student-identification/$id';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
