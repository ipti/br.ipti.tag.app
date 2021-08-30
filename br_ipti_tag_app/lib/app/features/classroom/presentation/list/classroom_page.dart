import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';

import 'package:meta/meta.dart';

import '../../domain/entities/classroom.dart';
import 'bloc/classroom_list_bloc.dart';
import 'bloc/classroom_list_events.dart';
import 'bloc/classroom_list_states.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key key, this.title = 'Listagem de Turmas'})
      : super(key: key);

  final String title;

  @override
  ClassroomPageState createState() => ClassroomPageState();
}

class ClassroomPageState
    extends ModularState<ClassroomPage, ClassroomListBloc> {
  @override
  void initState() {
    controller.add(GetListClassroomsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Turmas", widget.title],
      body: <Widget>[
        SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: TagButton(
                  text: "Criar turma",
                  onPressed: () => Modular.to.pushNamed("create"),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<ClassroomListBloc, ClassroomListState>(
          bloc: controller,
          builder: (context, state) {
            if (state is LoadedState) {
              return TagDataTable(
                columns: const [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Etapa")),
                  DataColumn(label: Text("")),
                ],
                source: ClassroomDatatable(
                  data: state.classrooms,
                ),
              );
            } else if (state is EmptyState) {
              return TagDataTable(
                columns: const [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Etapa")),
                  DataColumn(label: Text("")),
                ],
                source: ClassroomDatatable(
                  data: [],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

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

class ClassroomDatatable extends DataTableSource {
  ClassroomDatatable({
    @required this.data,
  });

  final List<Classroom> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].stageId.toString())),
      const DataCell(Icon(Icons.edit)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
