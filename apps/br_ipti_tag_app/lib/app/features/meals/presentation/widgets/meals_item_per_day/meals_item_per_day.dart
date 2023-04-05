import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/filter_menu_dialog/filter_menu_dialog.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/meal_item/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';


class MealsItemDay extends StatelessWidget {
  const MealsItemDay({
    super.key,
    required this.meals,
    required this.fullnameDay,
    required this.currentDate,
  });

  final List<Meal> meals;
  final String? fullnameDay;
  final String? currentDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    DateFormat('EEEE', 'pt_BR')
                        .format(DateTime.parse(fullnameDay!)),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat(' dd/MM', 'pt_BR')
                        .format(DateTime.parse(fullnameDay!)),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: TagColors.colorBaseInkLight,
                    ),
                  ),
                  Text(
                    " $currentDate",
                    style: const TextStyle(
                      color: TagColors.colorBaseInkLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TagButtonIcon(
                label: "Filtros",
                onPressed: () async {
              final success = await showDialog(
                context: context,
                builder: (_) {
                  return FilterMenuDialog();
                },
              );
            },
                icon: FilePaths.ICON_PENCIL_GREY_SVG,
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true, //just set this property
          padding: const EdgeInsets.all(8.0),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () => Modular.to.pushNamed("details", arguments: {
                  'meal': meal,
                  'mealComponent': meal.components[0],
                }),
                child: MealItem(
                  meal: meal,
                  mealComponent: meal.components[0],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
