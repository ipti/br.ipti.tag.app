import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

class DetailsItemStockPage extends StatefulWidget {
  const DetailsItemStockPage({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

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
    const infoText = TextStyle(color: TagColors.colorBaseInkNormal);

    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      aside: Container(),
      title: widget.ingredient.name,
      description: "Estoque de item",
      path: const [],
      body: <Widget>[],
    );
  }
}
