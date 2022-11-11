import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/data/models/student_model.dart';

class PutStudentsEndPoint extends EndPointAPI {
  PutStudentsEndPoint({
    required this.id,
    required this.model,
  });

  final int id;
  final StudentModel model;

  @override
  String get path => '/student-identification/$id';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
