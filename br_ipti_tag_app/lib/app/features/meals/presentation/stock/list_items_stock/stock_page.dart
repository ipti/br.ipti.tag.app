import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/add_stock_dialog/add_stock_dialog.dart';
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
    return TagScaffold(
      menu: const TagVerticalMenu(),
      title: widget.title,
      path: ["Merenda", widget.title],
      description: "Verifique o estoque de alimentos da escola",
      actionsHeader: AddSliverButton(),
      body: BlocBuilder<StockBloc, ListStockState>(
        bloc: controller,
        builder: (context, state) {
          if (state is LoadedState) {
            return TagDataTable(
              columns: const [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Quantidade")),
              ],
              source: IngredientDatatable(data: state.ingredients),
            );
          } else {
            return TagDataTable(
              columns: const [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Quantidade")),
              ],
              source: IngredientDatatable(data: []),
            );
          }
        },
      ),
    );
  }
}

class AddSliverButton extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDesktop = MediaQuery.of(context).size.width > 992;
    return Container(
      height: maxExtent,
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            fit: isDesktop ? FlexFit.loose : FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TagButton(
                text: "Adicionar ao estoque",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddStockDialog();
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class IngredientDatatable extends DataTableSource {
  IngredientDatatable({
    required this.data,
  });

  final List<Ingredient> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].amount.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
