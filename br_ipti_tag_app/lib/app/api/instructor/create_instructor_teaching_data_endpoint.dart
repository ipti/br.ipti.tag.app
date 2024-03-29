import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_create_model.dart';

class PostInstructorTeachingDataEndpoint extends EndPointAPI {
  final InstructorTeachingDataCreateModel instructorQuery;
  PostInstructorTeachingDataEndpoint(this.instructorQuery);

  @override
  String get path => '/instructorTeachingData';

  @override
  Parameters? get bodyParameters => instructorQuery.toJson;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
