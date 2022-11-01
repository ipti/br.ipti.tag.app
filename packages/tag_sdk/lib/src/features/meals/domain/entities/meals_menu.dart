import 'meal.dart';

class MealsMenu {
  MealsMenu({
    required this.meals,
    required this.fullnameDay,
    required this.currentDate,
  });
  final List<Meal> meals;
  final String? fullnameDay;
  final String? currentDate;
}
