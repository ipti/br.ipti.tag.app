import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/api/food_inventory/get_food_inventory_endpoint.dart';
import 'package:tag_sdk/src/features/meals/data/models/ingredient_inventory.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';

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
