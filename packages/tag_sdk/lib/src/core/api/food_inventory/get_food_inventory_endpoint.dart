import 'package:tag_network/tag_network.dart';

class ListFoodInventoryEndPoint extends EndPointAPI {
  @override
  String get path => '/food/inventory';

  @override
  Parameters? get bodyParameters => null;

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.GET;

  @override
  Parameters? get urlParameters => null;
}
