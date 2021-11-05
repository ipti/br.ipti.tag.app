import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

import 'meal_ingredient_json_mapper.dart';

class MealComponentJsonMapper
    extends CoreMapper<Map<String, dynamic>, ComponentResponse> {
  MealComponentJsonMapper({required this.ingredientJsonMapper});

  final MealIngredientJsonMapper ingredientJsonMapper;

  @override
  ComponentResponse call(Map<String, dynamic> map) {
    final ingredients =
        map['ingredients'] != null ? map['ingredients'] as List : [];

    return ComponentResponse(
      id: map['id'] as String?,
      description: map['description'] as String?,
      observation: map['observation'] as String?,
      ingredients: List<IngredientResponse>.from(ingredients.map(
        (x) => ingredientJsonMapper(x as Map<String, dynamic>),
      )),
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }
}
