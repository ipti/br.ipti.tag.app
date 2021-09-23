import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';

class MealModel extends Meal {
  MealModel({
    final String hour,
    final String tacoCode,
    final String foodName,
    final String turn,
    final String studentType,
    final String ingredients,
  }) : super(hour, tacoCode, foodName, turn, studentType, ingredients);

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      hour: map['hour'] as String,
      tacoCode: map['tacoCode'] as String,
      foodName: map['foodName'] as String,
      turn: map['turn'] as String,
      studentType: map['studentType'] as String,
      ingredients: map['ingredients'] as String,
    );
  }

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'mealType': mealType,
      'tacoCode': tacoCode,
      'foodName': foodName,
      'turn': turn,
      'studentType': studentType,
      'ingredients': ingredients,
    };
  }

  String toJson() => json.encode(toMap());
}
