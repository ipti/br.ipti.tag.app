import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/data/models/food_menu_model.dart';

import 'package:flutter/services.dart' show rootBundle;

abstract class MealsMenuDumbDataSource {
  Future<List<FoodMenuModel>> list();
}

class MealsMenuDumbDataSourceImpl implements MealsMenuDumbDataSource {
  @override
  Future<List<FoodMenuModel>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/meals_of_day.json",
    );
    final jsonResult = jsonDecode(data) as List;

    return jsonResult
        .map((e) => FoodMenuModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
