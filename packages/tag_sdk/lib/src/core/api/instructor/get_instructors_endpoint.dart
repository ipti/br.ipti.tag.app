import 'package:tag_network/tag_network.dart';

class GetInstructorsEndPoint extends EndPointAPI {
  GetInstructorsEndPoint();

  @override
  String get path => '/instructor';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
