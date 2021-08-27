import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';

class MealModel extends Meal {
  final String hour;
  final String tacoCode;
  final String foodName;
  final String turn;
  final String studentType;
  final String ingredients;

  MealModel({
    this.hour,
    this.tacoCode,
    this.foodName,
    this.turn,
    this.studentType,
    this.ingredients,
  }) : super(hour, tacoCode, foodName, turn, studentType, ingredients);

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'tacoCode': tacoCode,
      'foodName': foodName,
      'turn': turn,
      'studentType': studentType,
      'ingredients': ingredients,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      hour: map['hour'],
      tacoCode: map['tacoCode'],
      foodName: map['foodName'],
      turn: map['turn'],
      studentType: map['studentType'],
      ingredients: map['ingredients'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source));
}
