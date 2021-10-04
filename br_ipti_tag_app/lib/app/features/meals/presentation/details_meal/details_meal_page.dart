import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

class DetailsMealPage extends StatefulWidget {
  const DetailsMealPage({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final Meal meal;

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

    final ingredients = widget.meal.ingredients;
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      aside: Container(),
      title: widget.meal.foodName,
      description: "Ingredientes para a refeição",
      path: const [],
      body: <Widget>[
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
                          text: "${widget.meal.consistence} ", style: infoText),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(text: "Data e hora  ", style: labelText),
                    TextSpan(
                      text: "${widget.meal.turn} ",
                      style: infoText,
                    ),
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(text: "Tipo de Aluno ", style: labelText),
                    TextSpan(text: "${widget.meal.studentType ?? ''} "),
                  ]),
                ),
              ]),
        ),
        IngredientsList(
          ingredients: ingredients,
        ),
      ],
    );
  }
}
