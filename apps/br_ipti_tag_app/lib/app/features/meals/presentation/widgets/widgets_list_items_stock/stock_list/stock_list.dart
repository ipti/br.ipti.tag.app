import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/list_items_stock/stock_page.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widgets_list_items_stock/filter_stock_dialog/filter_stock_dialog.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/widgets_list_items_stock/ingredient_stock/ingredient_stock.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../../classroom/presentation/widgets/tag_button_icon.dart';
import '../../ingredient_item/ingredient_item.dart';

class StockList extends StatelessWidget {
  const StockList({
    super.key,
    required this.ingredients,
  });

  final List<Ingredients>? ingredients;
  @override
  Widget build(BuildContext context) {
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    const itemindicativeTitle = TextStyle(
      color: TagColors.colorBaseInkNormal,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagTextField(label: "Buscar no estoque"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Todos os itens",
                  style: itemindicativeTitle,
                ),
                TagButtonIcon(
                  label: "Filtros",
                  onPressed: () async {
                    final success = await showDialog(
                      context: context,
                      builder: (_) {
                        return FilterStockDialog();
                      },
                    );
                  },
                  icon: FilePaths.ICON_PENCIL_GREY_SVG,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Item",
                  style: itemSectionTitle,
                ),
                Text(
                  "Quantidade",
                  style: itemSectionTitle,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: TagColors.colorBaseInkLight,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true, //just set this property
              itemCount: ingredients!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IngredientStock(
                    ingredient: ingredients![index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
