import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        "/merenda/estoque/ingrediente",
        arguments: ingredient,
      ),
      child: TagBox(
        minHeight: 48,
        background: TagColors.colorBaseProductLighter,
        padding: EdgeInsets.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          dense: true,
          horizontalTitleGap: 8,
          title: Text(ingredient.name),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: TagColors.colorBaseInkNormal,
          ),
        ),
      ),
    );
  }
}
