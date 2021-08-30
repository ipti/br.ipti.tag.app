import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/meal_item/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class MealsItemDay extends StatelessWidget {
  const MealsItemDay({
    Key key,
    @required this.meals,
    @required this.fullnameDay,
    @required this.currentDate,
  }) : super(key: key);

  final List<Meal> meals;
  final String fullnameDay;
  final String currentDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                fullnameDay,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                " $currentDate",
                style: const TextStyle(
                  color: TagColors.colorBaseProductLight,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true, //just set this property
          padding: const EdgeInsets.all(8.0),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final currentMeal = meals[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: MealItem(
                tacoCode: currentMeal.tacoCode,
                foodName: currentMeal.foodName,
                turn: currentMeal.turn,
                studentType: currentMeal.studentType,
                ingredients: currentMeal.ingredients,
                hour: currentMeal.hour,
              ),
            );
          },
        ),
      ],
    );
  }
}
