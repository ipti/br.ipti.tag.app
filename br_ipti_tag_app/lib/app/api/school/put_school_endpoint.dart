import 'package:br_ipti_tag_app/app/api/school/dto/school_update.dto.dart';
import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_headers.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class PutSchoolEndPoint extends EndPointAPI {
  final String schoolId;
  final SchoolUpdateDto schoolDto;
  PutSchoolEndPoint(this.schoolId, this.schoolDto);

  @override
  String get path => "/school/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  HTTPHeaders? get headers => () => {
        'Content-Type': ContentType.APPLICATION_JSON,
      };

  @override
  Parameters? get bodyParameters => null;

  @override
  Parameters? get urlParameters => null;
}
