import 'meal_component.dart';

class Meal {
  Meal({
    required this.mealType,
    required this.tacoCode,
    required this.foodName,
    required this.turn,
    required this.studentType,
    required this.components,
  });
  final String mealType;
  final String tacoCode;
  final String foodName;
  final String turn;
  final String studentType;
  final List<MealComponent> components;
}
