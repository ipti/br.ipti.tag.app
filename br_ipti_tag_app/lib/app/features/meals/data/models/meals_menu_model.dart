import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:meta/meta.dart';

import 'meal_model.dart';

class MealsMenuModel extends MealsMenu {
  MealsMenuModel({
    @required List<MealModel> meals,
    @required String fullnameDay,
    @required String currentDate,
  }) : super(meals, fullnameDay, currentDate);

  factory MealsMenuModel.fromMap(Map<String, dynamic> map) {
    final meals = map['meals'] as List;
    return MealsMenuModel(
      meals: List<MealModel>.from(meals?.map(
        (x) => MealModel.fromMap(x as Map<String, dynamic>),
      )),
      fullnameDay: map['fullnameDay'] as String,
      currentDate: map['currentDate'] as String,
    );
  }

  factory MealsMenuModel.fromJson(String source) =>
      MealsMenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'meals': meals?.map((x) => (x as MealModel).toMap())?.toList(),
      'fullnameDay': fullnameDay,
      'currentDate': currentDate,
    };
  }

  String toJson() => json.encode(toMap());
}
