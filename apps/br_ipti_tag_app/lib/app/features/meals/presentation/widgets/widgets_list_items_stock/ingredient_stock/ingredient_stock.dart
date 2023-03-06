import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/list_items_stock/stock_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class IgredientStock extends StatelessWidget {
  
  final String name;

  final int stock;

  const IgredientStock({super.key, required this.name, required this.stock});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => {},
      child: TagBox(
        minHeight: 48,
        background: TagColors.colorBaseProductLighter,
        padding: EdgeInsets.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          dense: true,
          horizontalTitleGap: 8,
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing:Text(stock.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
