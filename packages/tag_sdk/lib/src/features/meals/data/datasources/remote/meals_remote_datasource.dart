import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/food_menu/get_food_menu_endpoint.dart';
import 'package:tag_sdk/src/features/meals/data/models/food_menu_model.dart';

class MealsMenuRemoteDataSource {
  MealsMenuRemoteDataSource(
    this.httpClient,
  );

  final RouterAPI httpClient;

  Future<List<FoodMenuModel>> listAll() async {
    final response = await httpClient.requestListFrom(
      route: GetFoodMenuEndPoint(),
    );

    final List<FoodMenuModel> mappedList = response.data!
        .map(
          (e) => FoodMenuModel.fromMap(e),
        )
        .toList();

    return mappedList;
  }
}
