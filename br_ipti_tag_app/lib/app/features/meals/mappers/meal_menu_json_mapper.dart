import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

import 'meal_json_mapper.dart';

class MealMenuJsonMapper
    extends CoreMapper<Map<String, dynamic>, FoodMenuResponse> {
  MealMenuJsonMapper({required this.mealJsonMapper});

  final MealJsonMapper mealJsonMapper;
  @override
  FoodMenuResponse call(Map<String, dynamic> map) {
    final referenceDates =
        map['referenceDates'] != null ? map['referenceDates'] as List : [];
    final ageRange = map['ageRange'] != null ? map['ageRange'] as List : [];
    final meals = map['meals'] != null ? map['meals'] as List : [];
    return FoodMenuResponse(
      referenceDates: List<String>.from(referenceDates),
      ageRange: List<int>.from(ageRange),
      id: map['id'] as String?,
      description: map['description'] as String?,
      observation: map['observation'] as String?,
      meals: List<MealResponse>.from(meals.map(
        (x) => mealJsonMapper(x as Map<String, dynamic>),
      )),
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      v: map['v'] as int?,
    );
  }
}
