import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/ingredient_inventory.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';

import '../../../../../api/food_inventory/list_food_inventory_endpoint.dart';

abstract class IngredientRemoteDataSource {
  Future<List<InvetoryIngredient>> list();
}

class IngredientRemoteDataSourceImpl implements IngredientRemoteDataSource {
  IngredientRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<List<InvetoryIngredient>> list() async {
    final response = await _httpClient.requestListOf(
      route: ListFoodInventoryEndPoint(),
    );

    final ingredients = InvetoryIngredientModel.fromList(
      response.data! as List,
    );

    return ingredients;
  }
}
