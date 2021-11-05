import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

class MealIngredientJsonMapper
    extends CoreMapper<Map<String, dynamic>, IngredientResponse> {
  @override
  IngredientResponse call(Map<String, dynamic> map) {
    final alternatives =
        map['alternatives'] != null ? map['alternatives'] as List : [];

    return IngredientResponse(
        id: map['id'] as String?,
        foodId: map['foodId'] as String?,
        amount: map['amount'] as num,
        measurementUnit: map['measurementUnit'] as String?,
        replaceable: map['replaceable'] as bool?,
        createdAt: map['createdAt'] as String?,
        updatedAt: map['updatedAt'] as String?,
        alternatives: List<String>.from(alternatives));
  }
}
