import 'dart:convert';

import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/features/meals/mappers/meal_ingredient_json_mapper.dart';

import 'package:flutter/services.dart' show rootBundle;

abstract class IngredientDumbDataSource {
  Future<List<IngredientResponse>> list();
}

class IngredientDumbDataSourceImpl implements IngredientDumbDataSource {
  IngredientDumbDataSourceImpl({required this.mapper});

  final MealIngredientJsonMapper mapper;

  @override
  Future<List<IngredientResponse>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/stock.json",
    );
    final jsonResult = jsonDecode(data) as List;
    return jsonResult.map((e) => mapper(e as Map<String, dynamic>)).toList();
  }
}
