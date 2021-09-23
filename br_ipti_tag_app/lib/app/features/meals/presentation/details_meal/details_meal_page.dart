import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
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
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseProductNormal,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final ingredients = widget.meal.ingredients.split(',');
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
                          text: "${widget.meal.foodName} ", style: infoText),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(text: "Data e hora  ", style: labelText),
                    TextSpan(text: "${widget.meal.turn} ", style: infoText),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Item",
                style: itemSectionTitle,
              ),
            ),
            Container(
              height: 1,
              color: TagColors.colorBaseProductNormal,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return TagBox(
                    minHeight: 48,
                    background: TagColors.colorBaseProductLighter,
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      dense: true,
                      horizontalTitleGap: 8,
                      title: Text(ingredients[index]),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: TagColors.colorBaseInkNormal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
