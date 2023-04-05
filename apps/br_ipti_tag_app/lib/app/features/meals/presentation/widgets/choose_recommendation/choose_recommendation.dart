import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredient_substation/ingredient_substation.dart';
import 'package:flutter/cupertino.dart';
import 'package:tag_ui/tag_ui.dart';

class ChooseRecomendation extends StatelessWidget {
  const ChooseRecomendation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseInkNormal,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    const choose = <FoodMenu>[
      FoodMenu(
        ingredientAdd: "Leite de coco",
        ingredientRemove: "leite de vaca",
        priority: 1,
        select: true,
      ),
      FoodMenu(
        ingredientAdd: "Leite de soja",
        ingredientRemove: "leite de vaca",
        priority: 2,
        select: false,
      ),
      FoodMenu(
        ingredientAdd: "Sopa de carne",
        ingredientRemove: "Mingau de Milho",
        priority: 3,
        select: false,
      ),
    ];
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Escolha uma das recomendações",
            style: itemSectionTitle,
          ),
          const IngredientSubstation(recommendation: choose),
        ],
      ),
    );
  }
}

class FoodMenu {
  const FoodMenu({
    required this.ingredientAdd,
    required this.ingredientRemove,
    required this.priority,
    required this.select,
  });

  final String ingredientAdd;
  final String ingredientRemove;
  final int priority;
  final bool select;

  factory FoodMenu.fromJson(Map<String, dynamic> json) => FoodMenu(
        ingredientAdd: json["ingredientAdd"],
        ingredientRemove: json["ingredientRemove"],
        priority: json["priority"],
        select: json["select"],
      );

  Map<String, dynamic> toJson() => {
        "ingredientAdd": ingredientAdd,
        "ingredientRemove": ingredientRemove,
        "priority": priority,
        "select": select,
      };
}
