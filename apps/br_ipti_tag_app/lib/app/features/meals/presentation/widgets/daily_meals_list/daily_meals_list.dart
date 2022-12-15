import 'package:flutter/material.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../meals_item_per_day/meals_item_per_day.dart';

class DailyMealsList extends StatelessWidget {
  const DailyMealsList({
    super.key,
    required this.mealsOfDay,
  });

  final List<MealsMenu> mealsOfDay;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //just set this property
      padding: const EdgeInsets.all(8.0),
      itemCount: mealsOfDay.length,
      itemBuilder: (context, index) {
        final current = mealsOfDay[index];

        return MealsItemDay(
          fullnameDay: current.fullnameDay,
          currentDate: current.currentDate,
          meals: current.meals,
        );
      },
    );
  }
}