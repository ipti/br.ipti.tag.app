import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class PutSchoolEndPoint extends EndPointAPI {
  PutSchoolEndPoint(
    this.schoolId,
    this.schoolDto,
  );

  final String schoolId;
  final School schoolDto;

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
