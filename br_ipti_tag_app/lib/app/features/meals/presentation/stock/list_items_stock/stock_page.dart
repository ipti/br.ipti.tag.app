import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/ingredients_list/ingredients_list.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/stock_bloc.dart';
import 'bloc/stock_events.dart';
import 'bloc/stock_states.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key, this.title = 'Estoque'}) : super(key: key);

  final String title;

  @override
  StockPageState createState() => StockPageState();
}

class StockPageState extends ModularState<StockPage, StockBloc> {
  @override
  void initState() {
    controller.add(GetListStockEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      path: ["Merenda Escolar", widget.title],
      description: "Verifique o estoque de alimentos da escola",
      body: <Widget>[
        BlocBuilder<StockBloc, ListStockState>(
          bloc: controller,
          builder: (context, state) {
            if (state is LoadedState) {
              return IngredientsList(ingredients: state.ingredients);
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
