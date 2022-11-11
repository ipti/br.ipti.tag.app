import 'package:tag_network/tag_network.dart';

class GetSchoolsEndPoint extends EndPointAPI {
  @override
  String get path => "/school";

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  HTTPHeaders? get headers => null;

  @override
  Parameters? get bodyParameters => null;

  @override
  Parameters? get urlParameters => null;
}
