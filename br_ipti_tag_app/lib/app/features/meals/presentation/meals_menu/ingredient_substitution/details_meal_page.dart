import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal_component.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class DetailsMealPage extends StatefulWidget {
  const DetailsMealPage({
    Key? key,
    required this.mealComponent,
  }) : super(key: key);

  final MealComponent mealComponent;

  @override
  DetailsMealPageState createState() => DetailsMealPageState();
}

class DetailsMealPageState extends State<DetailsMealPage> {
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
      title: widget.mealComponent.description,
      description: "Ingredientes para a refeição",
      path: const [],
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
