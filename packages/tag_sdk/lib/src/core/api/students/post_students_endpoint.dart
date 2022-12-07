import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

class PostStudentsEndPoint extends EndPointAPI {
  PostStudentsEndPoint({
    required this.model,
  });

  final StudentIdentification model;

  @override
  String get path => '/student-identification';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
