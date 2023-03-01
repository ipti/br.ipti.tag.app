import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("recomendacoes", arguments: {
        'mealComponent': "",
      }),
      child: TagBox(
        minHeight: 48,
        background: TagColors.colorBaseProductLighter,
        padding: EdgeInsets.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          dense: true,
          horizontalTitleGap: 8,
          title: Text(
            ingredient.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: TagColors.colorBaseInkNormal,
          ),
        ),
      ),
    );
  }
}
