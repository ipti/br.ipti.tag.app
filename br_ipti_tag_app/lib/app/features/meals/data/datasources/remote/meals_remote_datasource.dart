import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/api/food_menu/list_food_menu_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/mappers/meal_menu_json_mapper.dart';

class MealsMenuRemoteDataSource {
  MealsMenuRemoteDataSource({
    required this.httpClient,
    required this.mapper,
  });

  final RouterAPI httpClient;

  final MealMenuJsonMapper mapper;

  Future<List<FoodMenuResponse>> listAll() async {
    final response = await httpClient.requestListOf(
      route: ListFoodMenuEndPoint(),
    );

    final List<FoodMenuResponse> mappedList =
        response.data!.map((e) => mapper(e as Map<String, dynamic>)).toList();

    return mappedList;
  }
}
