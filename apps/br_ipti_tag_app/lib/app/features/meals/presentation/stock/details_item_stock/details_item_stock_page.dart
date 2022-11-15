import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
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
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      body: Container(),
    );
  }
}
