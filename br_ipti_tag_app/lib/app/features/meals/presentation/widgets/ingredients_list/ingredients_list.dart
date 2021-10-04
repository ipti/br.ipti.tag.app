import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredient_item/ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<Ingredient>? ingredients;

  @override
  Widget build(BuildContext context) {
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseProductNormal,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Item",
          style: itemSectionTitle,
        ),
      ),
      Container(
        height: 1,
        color: TagColors.colorBaseProductNormal,
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
        child: ListView.builder(
          shrinkWrap: true, //just set this property
          padding: const EdgeInsets.all(8.0),
          itemCount: ingredients!.length,
          itemBuilder: (context, index) {
            return IngredientItem(
              ingredient: ingredients![index],
            );
          },
        ),
      ),
    ]);
  }
}
