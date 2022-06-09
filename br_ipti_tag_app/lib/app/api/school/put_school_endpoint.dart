import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_headers.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';

class PutSchoolEndPoint extends EndPointAPI {
  PutSchoolEndPoint(
    this.schoolId,
    this.schoolDto,
  );

  final String schoolId;
  final SchoolEntity schoolDto;

  @override
  String get path => "/school/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  HTTPHeaders? get headers => () => {
        'Content-Type': ContentType.APPLICATION_JSON,
      };

  @override
  Parameters? get bodyParameters => () => schoolDto.toMap();
  @override
  Parameters? get urlParameters => null;
}
