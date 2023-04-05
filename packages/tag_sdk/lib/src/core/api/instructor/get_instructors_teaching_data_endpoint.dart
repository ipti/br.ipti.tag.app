import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/classroom/data/model/list_instructors_teaching_data_params.dart';

class GetInstructorsTeachingDataEndPoint extends EndPointAPI {
  final ListInstructorsTeachingDataParams instructorTeachingDataQuery;
  GetInstructorsTeachingDataEndPoint(this.instructorTeachingDataQuery);

  @override
  String get path => '/instructorTeachingData';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => instructorTeachingDataQuery.toJson;
}
