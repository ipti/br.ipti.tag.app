import 'meal.dart';

class MealsMenu {
  MealsMenu(
    this.meals,
    this.fullnameDay,
    this.currentDate,
  );
  final List<Meal> meals;
  final String fullnameDay;
  final String currentDate;
}
