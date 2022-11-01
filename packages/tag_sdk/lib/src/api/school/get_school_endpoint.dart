import 'package:tag_network/tag_network.dart';

class GetSchoolEndPoint extends EndPointAPI {
  final String schoolId;
  GetSchoolEndPoint(this.schoolId);

  @override
  String get path => "/school-identification/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  HTTPHeaders? get headers => () => {
        'Content-Type': ContentType.APPLICATION_JSON,
      };

  @override
  Parameters? get bodyParameters => null;

  @override
  Parameters? get urlParameters => null;
}
