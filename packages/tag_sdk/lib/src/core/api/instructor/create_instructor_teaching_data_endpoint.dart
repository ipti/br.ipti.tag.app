import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_create_model.dart';

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
