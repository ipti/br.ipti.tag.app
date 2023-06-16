import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/list_items_stock/stock_page.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../../classroom/presentation/widgets/tag_button_icon.dart';
import '../filter_details_item_stock/filter_details_item_stock.dart';
import '../warn_to_miss/warn_to_miss_dialog.dart';

class WarnAbsence extends StatelessWidget {
  final Ingredients ingredient;

  const WarnAbsence({super.key, required this.ingredient});
  @override
  Widget build(BuildContext context) {
    const textBold = TextStyle(
      color: TagColors.colorBaseInkNormal,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            "Previsão de estoque",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
            width: 128,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ingredient.stock.toString(),
                  style: textBold,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TagButton(
                text: "Avisar falta",
                onPressed: () async {
                  final success = await showDialog(
                    context: context,
                    builder: (_) {
                      return WarnToMiss();
                    },
                  );
                },
                backgroundColor: TagColors.colorBaseCloudLightActive,
                textStyle: const TextStyle(color: TagColors.colorBaseInkNormal),
              ),
              TagButtonIcon(
                label: "Filtro",
                onPressed: () async {
                  final success = await showDialog(
                    context: context,
                    builder: (_) {
                      return FilterDeatilsItemStock();
                    },
                  );
                },
                icon: FilePaths.ICON_PENCIL_GREY_SVG,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
