import 'dart:convert';

import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/features/meals/mappers/meal_menu_json_mapper.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class MealsMenuDumbDataSource {
  Future<List<FoodMenuResponse>> list();
}

class MealsMenuDumbDataSourceImpl implements MealsMenuDumbDataSource {
  MealsMenuDumbDataSourceImpl({
    required this.mapper,
  });

  final MealMenuJsonMapper mapper;
  @override
  Future<List<FoodMenuResponse>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/meals_of_day.json",
    );
    final jsonResult = jsonDecode(data) as List;
    return jsonResult.map((e) => mapper(e as Map<String, dynamic>)).toList();
  }
}
