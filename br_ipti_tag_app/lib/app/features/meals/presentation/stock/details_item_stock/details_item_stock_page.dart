import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class DetailsItemStockPage extends StatefulWidget {
  const DetailsItemStockPage({
    super.key,
    required this.ingredient,
  });

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
    return TagScaffold(
      menu: const TagVerticalMenu(),
      title: widget.ingredient.name,
      description: "Estoque de item",
      path: const [],
      body: Container(),
    );
  }
}
