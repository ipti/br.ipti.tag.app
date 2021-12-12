import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class InventoryIngredientsList extends StatelessWidget {
  const InventoryIngredientsList({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<InvetoryIngredient>? ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: TagColors.colorBaseProductNormal,
        ),
        TagDataTable(
          columns: const [
            DataColumn(label: Text("Item")),
            DataColumn(label: Text("Armazenamento")),
            DataColumn(label: Text("Situação")),
            DataColumn(label: Text("Ver detalhes")),
          ],
          source: InvetoryIngredientsDataSource(
            data: ingredients ?? [],
          ),
        ),
      ],
    );
  }
}

class InvetoryIngredientsDataSource extends DataTableSource {
  InvetoryIngredientsDataSource({
    required this.data,
  });

  final List<InvetoryIngredient> data;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(data[index].food?.description ?? data[index].foodId)),
        DataCell(
          Text(
            '${data[index].amount} ${data[index].measurementUnit.name}',
          ),
        ),
        const DataCell(Text("Em Falta")),
        DataCell(const Center(child: Icon(Icons.visibility)), onTap: () {
          Modular.to.pushNamed(
            "ingrediente",
            arguments: data[index].objectId,
          );
        }),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
