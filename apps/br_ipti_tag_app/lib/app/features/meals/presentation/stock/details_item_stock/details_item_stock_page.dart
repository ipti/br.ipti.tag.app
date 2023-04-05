import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/list_items_stock/stock_page.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/filter_details_item_stock/filter_details_item_stock.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/remove_warn/remove_warn.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/warn_absence/warn_absence.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widget_details_item_stock/warn_to_miss/warn_to_miss_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../../core/util/routes/routes.dart';

class DetailsItemStockPage extends StatefulWidget {
  const DetailsItemStockPage({
    super.key,
    required this.ingredient,
  });

  final Ingredients ingredient;

  @override
  DetailsItemStockPageState createState() => DetailsItemStockPageState();
}

class DetailsItemStockPageState extends State<DetailsItemStockPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const labelText = TextStyle(color: TagColors.colorBaseInkLight);
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    
  

    print(widget.ingredient.warn.toString());

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.ingredient.name,
      //description: "Estoque de item",
      path: [AppRoutes.merenda, TagPath("", widget.ingredient.name)],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Estoque de item",
              style: labelText,
            ),
            if(!widget.ingredient.warn)
              WarnAbsence(ingredient: widget.ingredient),
            if(widget.ingredient.warn)
              RemoveWarn(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Movim.",
                    style: itemSectionTitle,
                  ),
                  Text(
                    "Quantidade",
                    style: itemSectionTitle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:16.0),
                    child: Text(
                      "Data",
                      style: itemSectionTitle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: TagColors.colorBaseInkLight,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Entrada",
                    style: TextStyle(
                      color: TagColors.colorGreenLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "12000kg",
                  ),
                  Text(
                    "22/02/2023",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
