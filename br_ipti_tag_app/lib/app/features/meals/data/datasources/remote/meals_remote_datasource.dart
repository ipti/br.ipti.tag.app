import 'package:br_ipti_tag_app/app/api/food_menu/list_food_menu_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/models/meals_menu_model.dart';

abstract class MealsMenuRemoteDataSource {
  Future<List<MealsMenuModel>> list();
}

class MealsMenuRemoteDataSourceImpl implements MealsMenuRemoteDataSource {
  MealsMenuRemoteDataSourceImpl(this._httpClient);

  final RouterAPI _httpClient;

  @override
  Future<List<MealsMenuModel>> list() async {
    final response = await _httpClient.requestListOf(
      route: ListFoodMenuEndPoint(),
    );
    return MealsMenuModel.fromList(response.data! as List);
  }
}
