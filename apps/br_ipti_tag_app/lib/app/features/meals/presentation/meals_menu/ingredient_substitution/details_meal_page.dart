import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class SubstitutionIngredient extends StatefulWidget {
  const SubstitutionIngredient({
    super.key,
    required this.mealComponent,
  });

  final MealComponent mealComponent;

  @override
  SubstitutionIngredientState createState() => SubstitutionIngredientState();
}

class SubstitutionIngredientState extends State<SubstitutionIngredient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const labelText = TextStyle(color: TagColors.colorBaseInkLight);
    const infoText = TextStyle(color: TagColors.colorBaseInkNormal);

    final ingredients = widget.mealComponent.ingredients;

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.mealComponent.description,
      description: "Ingredientes para a refeição",
      path: const [],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "Consistência ", style: labelText),
                      TextSpan(
                        text: "${widget.mealComponent.consistence} ",
                        style: infoText,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "Data e hora  ", style: labelText),
                      TextSpan(
                        // text: "${widget.mealComponent.turn} ",
                        text: "{widget.mealComponent.turn}",
                        style: infoText,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "Tipo de Aluno ", style: labelText),
                      TextSpan(text: "{widget.mealComponent.studentType} "),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IngredientsList(
            ingredients: ingredients,
          ),
        ],
      ),
    );
  }
}
