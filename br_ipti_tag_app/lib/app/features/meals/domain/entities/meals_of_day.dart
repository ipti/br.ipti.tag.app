import 'meal.dart';

class MealsOfDay {
  MealsOfDay(
    this.meals,
    this.fullnameDay,
    this.currentDate,
  );
  final List<Meal> meals;
  final String fullnameDay;
  final String currentDate;
}
