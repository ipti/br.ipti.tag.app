import 'package:br_ipti_tag_app/app/api/food_inventory/get_food_inventory_endpoint.dart';
import 'package:br_ipti_tag_app/app/api/food_inventory/post_food_inventory_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/ingredient_inventory.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';

abstract class IngredientRemoteDataSource {
  Future<List<InvetoryIngredient>> list();
  Future<InvetoryIngredient> create(InvetoryIngredientModel ingredient);
}

class IngredientRemoteDataSourceImpl implements IngredientRemoteDataSource {
  IngredientRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<List<InvetoryIngredient>> list() async {
    final response = await _httpClient.requestListFrom(
      route: ListFoodInventoryEndPoint(),
    );

    final result = InvetoryIngredientModel.fromList(
      response.data! as List,
    );

    return result;
  }

  @override
  Future<InvetoryIngredient> create(InvetoryIngredientModel ingredient) async {
    final response = await _httpClient.request(
      route: PostIngredientInventoryEndPoint(model: ingredient),
    );

    return InvetoryIngredientModel.fromMap(response.data!);
  }
}
