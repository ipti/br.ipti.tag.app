import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';

class PostInstructorEndPoint extends EndPointAPI {
  PostInstructorEndPoint({
    required this.model,
  });

  final Instructor model;

  @override
  String get path => '/instructor';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
