import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';

class PutInstructorEndPoint extends EndPointAPI {
  PutInstructorEndPoint({
    required this.objectId,
    required this.model,
  });

  final Instructor model;
  final int objectId;

  @override
  String get path => '/instructor/$objectId';

  @override
  Parameters? get bodyParameters => () => model.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
