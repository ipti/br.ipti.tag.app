import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/list_items_stock/stock_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class IngredientStock extends StatelessWidget {
  
 

  final Ingredients ingredient;

  const IngredientStock({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("ingrediente", arguments: 
         ingredient,
      ),
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
          trailing: Text(ingredient.stock.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
