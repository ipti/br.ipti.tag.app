import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_create_model.dart';

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
