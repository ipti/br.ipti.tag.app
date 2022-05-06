import 'package:br_ipti_tag_app/app/api/food_inventory/get_food_inventory_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/ingredient_inventory.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';

abstract class IngredientRemoteDataSource {
  Future<List<Ingredient>> list();
}

class IngredientRemoteDataSourceImpl implements IngredientRemoteDataSource {
  IngredientRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<List<Ingredient>> list() async {
    final response = await _httpClient.requestListFrom(
      route: ListFoodInventoryEndPoint(),
    );

    InvetoryIngredientModel.fromList(
      response.data! as List,
    );

    return [];
  }
}
