import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/student/data/models/student_model.dart';

class PostStudentsEndPoint extends EndPointAPI {
  PostStudentsEndPoint({
    required this.model,
  });

  final StudentModel model;

  @override
  String get path => '/student-identification';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
