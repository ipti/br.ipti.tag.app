import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../widgets/widgets_list_items_stock/stock_list/stock_list.dart';
import 'bloc/stock_bloc.dart';
import 'bloc/stock_events.dart';
import 'bloc/stock_states.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key, this.title = 'Estoque'});

  final String title;

  @override
  StockPageState createState() => StockPageState();
}

class StockPageState extends State<StockPage> {
  final controller = Modular.get<StockBloc>();
  @override
  void initState() {
    controller.add(
      GetListStockEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const labelText = TextStyle(color: TagColors.colorBaseInkLight);
    const ingredients = <Ingredients>[Ingredients(name: "Milho verde", stock: 10), Ingredients(name: "arroz", stock: 5)];

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [AppRoutes.merenda, TagPath("", widget.title)],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      description: "Verifique o estoque de alimentos da escola",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Verifique o estoque de alimentos da escola",
                style: labelText,),
          ),
           StockList(ingredients: ingredients),
        ],
      ),
     
      // BlocBuilder<StockBloc, ListStockState>(
      //   bloc: controller,
      //   builder: (context, state) {
      //     if (state is LoadedState && state.ingredients.isNotEmpty) {
      //       return IngredientsList(ingredients: state.ingredients);
      //     }

      //     return TagEmpty(
      //       onPressedRetry: () => controller.add(GetListStockEvent()),
      //     );
      //   },
      // ),
    );
  }
}

class Ingredients {
  const Ingredients ({
    required this.name,
    required this.stock,
  });

  final String name;
  final int stock;

 
}
