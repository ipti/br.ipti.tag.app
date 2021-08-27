import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_of_day.dart';
import 'package:meta/meta.dart';

import 'meal_model.dart';

class MealsOfDayModel extends MealsOfDay {
  final List<MealModel> meals;
  final String fullnameDay;
  final String currentDate;
  MealsOfDayModel({
    @required this.meals,
    @required this.fullnameDay,
    @required this.currentDate,
  }) : super(meals, fullnameDay, currentDate);

  Map<String, dynamic> toMap() {
    return {
      'meals': meals?.map((x) => x.toMap())?.toList(),
      'fullnameDay': fullnameDay,
      'currentDate': currentDate,
    };
  }

  factory MealsOfDayModel.fromMap(Map<String, dynamic> map) {
    return MealsOfDayModel(
      meals:
          List<MealModel>.from(map['meals']?.map((x) => MealModel.fromMap(x))),
      fullnameDay: map['fullnameDay'],
      currentDate: map['currentDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MealsOfDayModel.fromJson(String source) =>
      MealsOfDayModel.fromMap(json.decode(source));
}
