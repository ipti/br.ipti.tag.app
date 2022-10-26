import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_update_model.dart';

class PutInstructorTeachingDataEndpoint extends EndPointAPI {
  final InstructorTeachingDataUpdateModel instructorQuery;
  final String id;
  PutInstructorTeachingDataEndpoint(this.instructorQuery, this.id);

  @override
  String get path => '/instructorTeachingData/$id';

  @override
  Parameters? get bodyParameters => instructorQuery.toJson;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  Parameters? get urlParameters => null;
}
