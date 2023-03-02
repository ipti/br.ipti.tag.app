import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class IngredientSubstation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: const [
            _Card(
              ingredientAdd: "leite de soja",
              ingredientRemove: "leite de vaca",
              priority: 1,
              select: true,
            ),
          ],
        ),
      ),
    );
  }

  // String _formatIngredients(List<Ingredient> ingredients) {
  //   final resultJoin = ingredients.join(', ');

  //   return resultJoin;
  // }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.ingredientAdd,
    required this.ingredientRemove,
    required this.priority,
    required this.select,
  });

  final String ingredientAdd;
  final String ingredientRemove;
  final int priority;
  final bool select;

  @override
  Widget build(BuildContext context) {
    const infoText = TextStyle(
        color: TagColors.colorBaseInkNormal,
        fontWeight: FontWeight.w600,
        fontSize: 14);

    const minText = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    const ingredientText = TextStyle(
      color: TagColors.colorBaseProductDark,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    return TagBox(
      minHeight: 100,
      background: select ? TagColors.colorBaseProductNormal : TagColors.colorBaseCloudLight,
      padding: const EdgeInsets.all(16),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: priority == 1 ? Colors.blue : priority == 2 ? Colors.blue : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const Text(
                      "Mudar ingredientes",
                      style: infoText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("remover: ", style: minText),
                    Text(ingredientRemove, style: ingredientText),
                  ],
                ),
                Row(
                  children: [
                    const Text("adicionar: ", style: minText),
                    Text(ingredientAdd, style: ingredientText),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
