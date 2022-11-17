import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/classroom/data/model/classroom_create_model.dart';

class PutClasroomEndPoint extends EndPointAPI {
  PutClasroomEndPoint(
    this.classroomModel,
    this.id,
  );

  ClassroomCreateModel classroomModel;
  int id;

  @override
  String get path => '/classroom/$id';

  @override
  Parameters? get bodyParameters => () => classroomModel.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
