import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/ingredient_inventory.dart';

class PostIngredientInventoryEndPoint extends EndPointAPI {
  PostIngredientInventoryEndPoint({
    required this.model,
  });

  final InvetoryIngredientModel model;

  @override
  String get path => '/food/inventory';

  @override
  Parameters? get bodyParameters => () => model.toMap();

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}
