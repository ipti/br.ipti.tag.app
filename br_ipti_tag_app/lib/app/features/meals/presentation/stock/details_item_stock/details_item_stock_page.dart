import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/detail_item_stock_bloc.dart';
import 'bloc/detail_item_stock_states.dart';

class DetailsItemStockPage extends StatefulWidget {
  const DetailsItemStockPage({
    Key? key,
    required this.ingredientId,
  }) : super(key: key);

  final String ingredientId;

  @override
  DetailsItemStockPageState createState() => DetailsItemStockPageState();
}

class DetailsItemStockPageState
    extends ModularState<DetailsItemStockPage, DetailItemStockBloc> {
  @override
  void initState() {
    super.initState();
    controller.getItemStock(widget.ingredientId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailItemStockBloc, DetailItemStockState>(
      bloc: controller,
      builder: (context, state) {
        if (state is LoadedState) {
          final title =
              state.ingredient.food?.description ?? "COMIDA NÃO DEFINIDA";
          return TagDefaultPage(
            menu: const TagVerticalMenu(),
            aside: Container(),
            title: title,
            description: "Cardápio semanal da sua escola",
            path: ["Merenda", "Estoque", title],
            body: <Widget>[
              if (state.ingredient.amount > 0)
                TagButtonSecondary(
                  text: "Avisar falta",
                  onPressed: () {},
                ),
              if (state.ingredient.amount <= 0) const _CardRemoveNotifier()
            ],
          );
        }
        return TagDefaultPage(
          menu: const TagVerticalMenu(),
          aside: Container(),
          title: "COMIDA NÃO DEFINIDA",
          description: "Cardápio semanal da sua escola",
          path: const [],
          body: const <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }
}

class _CardRemoveNotifier extends StatelessWidget {
  const _CardRemoveNotifier({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = TextStyle(
      color: TagColors.colorOrangeNormal,
      fontWeight: FontWeight.bold,
    );

    return TagBox(
      background: TagColors.colorBaseCloudLight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Este item pode estar em falta.", style: title),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 20),
              child: Text(
                  '''Alguém avisou que este ingredientees\n tá em falta. Acredita ser um engano?'''),
            ),
            TagButton(
              text: "Remover aviso de falta",
              backgroundColor: TagColors.colorOrangeNormal,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
