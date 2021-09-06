import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class TagDataTable extends StatelessWidget {
  const TagDataTable({
    Key key,
    @required this.columns,
    @required this.source,
  }) : super(key: key);

  final List<DataColumn> columns;
  final DataTableSource source;

  @override
  Widget build(BuildContext context) {
    const dataTableTheme = DataTableThemeData(
      headingTextStyle: TextStyle(
        color: TagColors.colorBaseInkLight,
        fontWeight: FontWeight.bold,
      ),
      dataTextStyle: TextStyle(
        color: TagColors.colorBaseInkNormal,
        fontWeight: FontWeight.w500,
      ),
      dividerThickness: 1,
    );

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth),
        child: Theme(
          data: ThemeData(
            dividerColor: TagColors.colorBaseCloudDark,
            dataTableTheme: dataTableTheme,
            cardTheme: const CardTheme(elevation: 0, margin: EdgeInsets.zero),
          ),
          child: PaginatedDataTable(
            headingRowHeight: 32,
            dataRowHeight: 32,
            columns: columns,
            source: source,
          ),
        ),
      ),
    );
  }
}
