import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/choose_recommendation/choose_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../update_ingredient_dialog/update_ingredient_dialog.dart';

class IngredientSubstation extends StatelessWidget {
  const IngredientSubstation({
    super.key,
    required this.recommendation,
  });

  final List<FoodMenu>? recommendation;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: ListView.builder(
                shrinkWrap: true, //just set this property
                padding: const EdgeInsets.all(8.0),
                itemCount: recommendation!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      final success = await showDialog(
                        context: context,
                        builder: (_) {
                          return UpdateIngredientDialog();
                        },
                      );
                    },
                    child: _Card(
                      ingredientAdd: recommendation![index].ingredientAdd,
                      ingredientRemove: recommendation![index].ingredientRemove,
                      priority: recommendation![index].priority,
                      select: recommendation![index].select,
                    ),
                  );
                },
              ),
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TagBox(
        minHeight: 100,
        background: TagColors.colorBaseCloudLight,
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
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: priority == 1
                                ? TagColors.colorGreenLight
                                : priority == 2
                                    ? TagColors.colorOrangeNormal
                                    : TagColors.colorRedDark,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              priority.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Mudar ingredientes",
                        style: infoText,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        const Text("remover: ", style: minText),
                        Text(ingredientRemove, style: ingredientText),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        const Text("adicionar: ", style: minText),
                        Text(ingredientAdd, style: ingredientText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
