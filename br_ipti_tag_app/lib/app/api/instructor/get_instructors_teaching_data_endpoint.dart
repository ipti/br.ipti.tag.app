import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';

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
