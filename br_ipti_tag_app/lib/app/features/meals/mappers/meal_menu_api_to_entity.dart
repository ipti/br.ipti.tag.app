import 'package:br_ipti_tag_app/app/api/food_menu/food_menu_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal_component.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';

class MealsMenuEntityMapper extends CoreMapper<FoodMenuResponse, MealsMenu> {
  @override
  MealsMenu call(FoodMenuResponse foodMenuResponse) {
    final meals = foodMenuResponse.meals?.map(mapResponseToMeal).toList() ?? [];
    return MealsMenu(
        meals: meals,
        fullnameDay: foodMenuResponse.referenceDates?.join(','),
        currentDate: "");
  }

  Meal mapResponseToMeal(MealResponse mealResponse) {
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

  MealComponent mapToMealComponent(ComponentResponse component) {
    return MealComponent(
      description: component.description ?? "",
      observation: component.observation ?? "",
      consistence: "Não possui na API",
      ingredients: component.ingredients?.map(mapToIngredient).toList() ?? [],
    );
  }

  Ingredient mapToIngredient(IngredientResponse ingredient) {
    return Ingredient(
      name: ingredient.foodId ?? "",
      amount: ingredient.amount ?? 0,
      available: ingredient.replaceable ?? false,
      substitutionSuggestion: [],
    );
  }
}
