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
                home: TagDataTable(
                  columns: const [
                    DataColumn(
                      label: Text("Nome"),
                    ),
                    DataColumn(
                      label: Text("Etapa"),
                    ),
                    DataColumn(
                      label: Text("Horário "),
                    ),
                  ],
                  source: DemoDatatable(),
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
            "gdhfdhfdhfd",
          ),
        ),
        DataCell(
          Text("gfdsgfdsgfds"),
        ),
        DataCell(
          Text("gggggggg"),
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
