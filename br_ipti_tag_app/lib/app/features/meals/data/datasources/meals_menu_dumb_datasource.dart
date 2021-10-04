import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import '../models/meals_menu_model.dart';

abstract class MealsMenuDumbDataSource {
  Future<List<MealsMenuModel>> list();
}

class MealsMenuDumbDataSourceImpl implements MealsMenuDumbDataSource {
  @override
  Future<List<MealsMenuModel>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/meals_of_day.json",
    );
    final jsonResult = jsonDecode(data) as List;
    return jsonResult
        .map((e) => MealsMenuModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
