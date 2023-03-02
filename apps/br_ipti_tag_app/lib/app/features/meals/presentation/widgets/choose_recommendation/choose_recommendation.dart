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
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Escolha uma das recomendações", style: itemSectionTitle,),
          IngredientSubstation(),
          IngredientSubstation(),
          IngredientSubstation(),
        ],
      ),
    );
  }
}
