import 'package:br_ipti_tag_app/app/core/api/food_menu/get_food_menu_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/food_menu_model.dart';

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
