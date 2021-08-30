import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_of_day.dart';
import 'package:meta/meta.dart';

import 'meal_model.dart';

class MealsOfDayModel extends MealsOfDay {
  MealsOfDayModel({
    @required List<MealModel> meals,
    @required String fullnameDay,
    @required String currentDate,
  }) : super(meals, fullnameDay, currentDate);

  factory MealsOfDayModel.fromMap(Map<String, dynamic> map) {
    final meals = map['meals'] as List<Map<String, dynamic>>;
    return MealsOfDayModel(
      meals: List<MealModel>.from(meals?.map((x) => MealModel.fromMap(x))),
      fullnameDay: map['fullnameDay'] as String,
      currentDate: map['currentDate'] as String,
    );
  }

  factory MealsOfDayModel.fromJson(String source) =>
      MealsOfDayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'meals': meals?.map((x) => (x as MealModel).toMap())?.toList(),
      'fullnameDay': fullnameDay,
      'currentDate': currentDate,
    };
  }

  String toJson() => json.encode(toMap());
}
