import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/data/models/ingredient_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class IngredientDumbDataSource {
  Future<List<IngredientModel>> list();
}

class IngredientDumbDataSourceImpl implements IngredientDumbDataSource {
  @override
  Future<List<IngredientModel>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/stock.json",
    );
    final jsonResult = jsonDecode(data) as List;

    return jsonResult
        .map(
          (e) => IngredientModel.fromMap(e),
        )
        .toList();
  }
}
