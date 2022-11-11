import 'package:tag_network/tag_network.dart';

class GetFoodMenuEndPoint extends EndPointAPI {
  @override
  String get path => '/food/menu';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
