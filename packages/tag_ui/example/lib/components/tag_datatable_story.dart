import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent datatable() => WidgetbookComponent(
      name: 'DataTable',
      useCases: [
        WidgetbookUseCase(
            name: 'Datatable',
            builder: (context) {
              return MaterialApp(
                home: Scaffold(
                  body: TagDataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          textAlign: TextAlign.center,
                          "Nome",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          textAlign: TextAlign.center,
                          "Etapa",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          textAlign: TextAlign.center,
                          "Horário",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                    source: DemoDatatable(),
                  ),
                ),
              );
            }),
      ],
    );

class DemoDatatable extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return const DataRow(
      cells: [
        DataCell(
          Text(
            "n1",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        DataCell(
          Text(
            "n2",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        DataCell(
          Text(
            "n3",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 3;

  @override
  int get selectedRowCount => 0;
}
