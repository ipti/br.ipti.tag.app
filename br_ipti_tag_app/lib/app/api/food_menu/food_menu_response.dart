class FoodMenuResponse {
  FoodMenuResponse({
    this.referenceDates,
    this.ageRange,
    this.id,
    this.description,
    this.observation,
    this.meals,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final List<String>? referenceDates;
  final List<int>? ageRange;
  final String? id;
  final String? description;
  final dynamic observation;
  final List<MealResponse>? meals;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
}

class MealResponse {
  MealResponse({
    this.weekDays,
    this.id,
    this.description,
    this.observation,
    this.mealType,
    this.components,
    this.createdAt,
    this.updatedAt,
  });

  final List<String>? weekDays;
  final String? id;
  final String? description;
  final String? observation;
  final String? mealType;
  final List<ComponentResponse>? components;
  final String? createdAt;
  final String? updatedAt;
}

class ComponentResponse {
  ComponentResponse({
    this.id,
    this.description,
    this.observation,
    this.ingredients,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? description;
  final String? observation;
  final List<IngredientResponse>? ingredients;
  final String? createdAt;
  final String? updatedAt;
}

class IngredientResponse {
  IngredientResponse({
    this.alternatives,
    this.id,
    this.foodId,
    this.amount,
    this.measurementUnit,
    this.replaceable,
    this.createdAt,
    this.updatedAt,
  });

  final List<String>? alternatives;
  final String? id;
  final String? foodId;
  final num? amount;
  final String? measurementUnit;
  final bool? replaceable;
  final String? createdAt;
  final String? updatedAt;
}
