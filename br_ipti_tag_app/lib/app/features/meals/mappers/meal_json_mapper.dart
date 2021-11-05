import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';

import 'meal_component_json_mapper.dart';

class MealJsonMapper extends CoreMapper<Map<String, dynamic>, MealResponse> {
  MealJsonMapper({required this.componentJsonMapper});

  final MealComponentJsonMapper componentJsonMapper;

  @override
  MealResponse call(Map<String, dynamic> map) {
    final weekDays = map['weekDays'] != null ? map['weekDays'] as List : [];
    final components =
        map['components'] != null ? map['components'] as List : [];

    return MealResponse(
      weekDays: List<String>.from(weekDays),
      id: map['id'] as String?,
      description: map['description'] as String?,
      observation: map['observation'] as String?,
      mealType: map['mealType'] as String?,
      components: List<ComponentResponse>.from(components.map(
        (x) => componentJsonMapper(x as Map<String, dynamic>),
      )),
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }
}
