import 'ingredient.dart';

class Meal {
  Meal(
    this.mealType,
    this.tacoCode,
    this.foodName,
    this.turn,
    this.studentType,
    this.ingredients,
    this.consistence,
  );
  final String mealType;
  final String tacoCode;
  final String foodName;
  final String turn;
  final String studentType;
  final List<Ingredient> ingredients;
  final String consistence;
}
