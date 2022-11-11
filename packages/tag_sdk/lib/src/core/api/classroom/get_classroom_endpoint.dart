import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/defaults/paginated_params.dart';

class GetClassroomEndPoint extends EndPointAPI {
  final ClassroomParams classroomParams;
  GetClassroomEndPoint(this.classroomParams);

  @override
  String get path => '/classroom';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => classroomParams.toJson;
}

class ClassroomParams extends PaginatedParams {
  final String? schoolId;

  ClassroomParams({
    super.perPage,
    super.page,
    this.schoolId,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "schoolId": schoolId,
        "page": page,
        "perPage": perPage,
      };
}
