import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'ingredient_model.dart';

class MealModel extends Meal {
  MealModel({
    required final String hour,
    required final String tacoCode,
    required final String foodName,
    required final String turn,
    required final String studentType,
    required final List<IngredientModel> ingredients,
    required final String consistence,
  }) : super(
          hour,
          tacoCode,
          foodName,
          turn,
          studentType,
          ingredients,
          consistence,
        );

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      hour: map['hour'] as String,
      tacoCode: map['tacoCode'] as String,
      foodName: map['foodName'] as String,
      turn: map['turn'] as String,
      studentType: map['studentType'] as String,
      ingredients: (map['ingredients'] as List)
          .map((e) => IngredientModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      consistence: map['consistence'] as String,
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
      'consistence': consistence
    };
  }

  String toJson() => json.encode(toMap());
}
