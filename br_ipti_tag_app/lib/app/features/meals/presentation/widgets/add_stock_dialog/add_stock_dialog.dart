import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class AddStockDialog extends StatelessWidget {
  const AddStockDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Adicionar item ao estoque"),
          _CloseButton(),
        ],
      ),
      content: const _Content(),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      actions: const [_Actions()],
      scrollable: true,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        icon: const Icon(Icons.close));
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: TagButton(
              text: "Adicionar",
              onPressed: () {},
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: TagButton(
            text: "Voltar",
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
              "Selecione os itens e quantidades para adicionar ao estoque"),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Flexible(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: TagTextField(label: "Selecione o item"),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: 150,
                height: 80,
                padding: const EdgeInsets.only(top: 16),
                child: TagNumberField(onChanged: (value) {}),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 16),
                child: TagButton(text: "Adicionar", onPressed: () {}),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 400,
          width: 614,
          child: TagDataTable(
            columns: const [
              DataColumn(label: Text("Nome")),
              DataColumn(label: Text("Quantidade"))
            ],
            source: AddItemsStockSource([
              Ingredient(
                  name: "Batata",
                  amount: 1,
                  available: true,
                  substitutionSuggestion: []),
            ]),
          ),
        ),
      ],
    );
  }
}

class AddItemsStockSource extends DataTableSource {
  final List<Ingredient> ingredients;

  AddItemsStockSource(this.ingredients);

  @override
  DataRow? getRow(int index) {
    final item = ingredients[index];
    return DataRow(cells: [
      DataCell(Text(item.name)),
      DataCell(Text(item.amount.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => throw UnimplementedError();

  @override
  int get rowCount => ingredients.length;

  @override
  int get selectedRowCount => 0;
}
