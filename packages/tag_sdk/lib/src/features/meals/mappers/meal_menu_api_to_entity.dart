import 'package:tag_sdk/src/core/defaults/mapper.dart';
import 'package:tag_sdk/src/features/meals/data/models/component_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/food_menu_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/ingredient_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/meal_model.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meal.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meal_component.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meals_menu.dart';

class MealsMenuEntityMapper extends CoreMapper<FoodMenuModel, MealsMenu> {
  @override
  MealsMenu call(FoodMenuModel param) {
    final meals = param.meals?.map(mapResponseToMeal).toList() ?? [];

    return MealsMenu(
      meals: meals,
      fullnameDay: param.referenceDates?.join(','),
      currentDate: "",
    );
  }

  Meal mapResponseToMeal(MealModel mealResponse) {
    final meal = Meal(
      mealType: mealResponse.mealType ?? "",
      tacoCode: mealResponse.id ?? "",
      foodName: mealResponse.description ?? "",
      turn: mealResponse.weekDays?.join(',') ?? "",
      studentType: "Nao possui na API",
      components:
          mealResponse.components?.map(mapToMealComponent).toList() ?? [],
    );

    return meal;
  }

  MealComponent mapToMealComponent(ComponentModel component) {
    return MealComponent(
      description: component.description ?? "",
      observation: component.observation ?? "",
      consistence: "Não possui na API",
      ingredients: component.ingredients?.map(mapToIngredient).toList() ?? [],
    );
  }

  Ingredient mapToIngredient(IngredientModel ingredient) {
    return Ingredient(
      name: ingredient.foodId ?? "",
      amount: ingredient.amount ?? 0,
      available: ingredient.replaceable ?? false,
      substitutionSuggestion: [],
    );
  }
}
