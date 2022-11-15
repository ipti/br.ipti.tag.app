import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/classroom/data/model/classroom_create_model.dart';

class PostClasroomEndPoint extends EndPointAPI {
  PostClasroomEndPoint(
    this.classroomModel,
  );

  ClassroomCreateModel classroomModel;

  @override
  String get path => '/classroom';

  @override
  Parameters? get bodyParameters => () => classroomModel.toJson();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
