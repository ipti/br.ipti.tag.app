import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/teacher/data/models/instructor_model.dart';

class PostInstructorEndPoint extends EndPointAPI {
  PostInstructorEndPoint({
    required this.model,
  });

  final InstructorModel model;

  @override
  String get path => '/instructor';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
