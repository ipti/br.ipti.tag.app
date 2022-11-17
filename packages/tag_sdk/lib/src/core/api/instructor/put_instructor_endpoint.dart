import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/teacher/data/models/instructor_model.dart';

class PutInstructorEndPoint extends EndPointAPI {
  PutInstructorEndPoint({
    required this.objectId,
    required this.model,
  });

  final InstructorModel model;
  final int objectId;

  @override
  String get path => '/instructor/$objectId';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
