import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import '../models/meals_of_day_model.dart';

abstract class MealsOfDayDumbDataSource {
  Future<List<MealsOfDayModel>> list();
}

class MealsOfDayDumbDataSourceImpl implements MealsOfDayDumbDataSource {
  @override
  Future<List<MealsOfDayModel>> list() async {
    final data = await rootBundle.loadString(
      "assets/dumb_data/meals_of_day.json",
    );
    final jsonResult = jsonDecode(data) as List<Map<String, dynamic>>;
    return jsonResult
        .map((Map<String, dynamic> e) => MealsOfDayModel.fromMap(e))
        .toList();
  }
}
