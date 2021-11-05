import 'ingredient.dart';

class MealComponent {
  MealComponent({
    required this.description,
    required this.observation,
    required this.consistence,
    required this.ingredients,
  });

  final String description;
  final String observation;
  final String consistence;
  final List<Ingredient> ingredients;
}
