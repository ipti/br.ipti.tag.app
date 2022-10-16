import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal_component.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.mealComponent,
    required this.meal,
  });

  final MealComponent mealComponent;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: _Card(
        mealType: meal.mealType,
        tacoCode: meal.tacoCode,
        foodName: mealComponent.description,
        turn: meal.turn,
        studentType: meal.studentType,
        ingredients: _formatIngredients(mealComponent.ingredients),
      ),
    );
  }

  String _formatIngredients(List<Ingredient> ingredients) {
    final resultJoin = ingredients.join(', ');
    return resultJoin;
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.tacoCode,
    required this.foodName,
    required this.turn,
    required this.mealType,
    required this.studentType,
    required this.ingredients,
  });

  final String? tacoCode;
  final String? foodName;
  final String? turn;
  final String? studentType;
  final String? mealType;
  final String ingredients;

  @override
  Widget build(BuildContext context) {
    return TagBox(
      minHeight: 100,
      background: TagColors.colorBaseCloudLight,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _MealTypeLabel(
                        mealType: mealType,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _LabelInfoTurnAndType(text: turn),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _LabelInfoTurnAndType(text: studentType),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    " $foodName",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: TagColors.colorBaseInkNormal,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      const Text(
                        "Ingredientes ",
                        style: TextStyle(
                          color: TagColors.colorBaseInkLight,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        ingredients,
                        style: const TextStyle(
                          color: TagColors.colorBaseProductNormal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}

class _LabelInfoTurnAndType extends StatelessWidget {
  const _LabelInfoTurnAndType({
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return TagBox(
      minHeight: 28,
      background: TagColors.colorBaseProductSecondary,
      child: Text(
        text!,
        style: const TextStyle(
          color: TagColors.colorBaseProductDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _MealTypeLabel extends StatelessWidget {
  const _MealTypeLabel({
    required this.mealType,
  });

  final String? mealType;

  @override
  Widget build(BuildContext context) {
    return TagBox(
      minHeight: 28,
      background: TagColors.colorBaseProductLightActive,
      child: Text(
        mealType!,
        style: const TextStyle(
          color: TagColors.colorBaseProductLogo,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
