import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredient_item/ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
    required this.ingredients,
  });

  final List<Ingredient>? ingredients;

  @override
  Widget build(BuildContext context) {
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Item",
            style: itemSectionTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 1,
            color: TagColors.colorBaseInkLight,
          ),
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
      ],
    );
  }
}
