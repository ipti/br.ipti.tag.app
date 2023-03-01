import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../../core/util/routes/routes.dart';

class SubstitutionIngredient extends StatefulWidget {
  const SubstitutionIngredient({
    super.key,
    required this.mealComponent,
  });

  final String mealComponent;

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
    const infoText = TextStyle(color: TagColors.colorBaseInkNormal, fontWeight: FontWeight.bold);

    //  final ingredients = widget.mealComponent.ingredients;

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: "Mingau de milho",
      description: "Ingredientes para a refeição",
      path: const [AppRoutes.merenda, TagPath("", "Recomendações")],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Ingredientes para a refeição", style: labelText),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 120),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "Consistência ", style: labelText),
                          TextSpan(
                            text: "Pastosa ",
                            style: infoText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Data e hora  ", style: labelText),
                          TextSpan(
                            text: DateFormat('EEEE ', 'pt_BR')
                                .format(DateTime.now()),
                            style: infoText,
                          ),
                          TextSpan(
                            text: DateFormat('dd/MM', 'pt_BR')
                                .format(DateTime.now()),
                            style: infoText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "Tipo de Aluno ", style: labelText),
                          TextSpan(text: "Fundamental", style: infoText),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IngredientsList(
            ingredients: [],
          ),
        ],
      ),
    );
  }
}
