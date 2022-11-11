import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_update_model.dart';

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
