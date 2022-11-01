import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tag_sdk/src/features/meals/data/models/food_menu_model.dart';

abstract class MealsMenuDumbDataSource {
  Future<List<FoodMenuModel>> listAll();
}

class MealsMenuDumbDataSourceImpl implements MealsMenuDumbDataSource {
  @override
  Future<List<FoodMenuModel>> listAll() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/meals_of_day.json",
    );
    final jsonResult = jsonDecode(data) as List;

    return jsonResult
        .map(
          (e) => FoodMenuModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();
  }
}
