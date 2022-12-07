import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tag_sdk/src/features/meals/data/models/ingredient_model.dart';

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
