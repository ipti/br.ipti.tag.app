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
  final String title;
  const ClassroomPage({Key key, this.title = 'Listagem de Turmas'})
      : super(key: key);
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
      menu: TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Turmas", widget.title],
      body: <Widget>[
        SizedBox(
          height: 80,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: TagButton(
                  text: "Cadastrar",
                  onPressed: () => Modular.to.pushNamed("create"),
                ),
              )
            ],
          ),
        ),
        BlocConsumer<ClassroomListBloc, ClassroomListState>(
          bloc: controller,
          listener: (context, state) => print(state.toString()),
          builder: (context, state) {
            if (state is LoadedState) {
              return TagDataTable(
                columns: [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Etapa")),
                ],
                source: ClassroomDatatable(
                  data: state.classrooms,
                ),
              );
            } else if (state is EmptyState) {
              return TagDataTable(
                columns: [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Etapa")),
                ],
                source: ClassroomDatatable(
                  data: [],
                ),
              );
            }
            return CircularProgressIndicator();
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
    final dataTableTheme = DataTableThemeData(
      headingRowColor: MaterialStateProperty.all(
        TagColors.colorTabIndicator,
      ),
      headingTextStyle: TextStyle(
        color: TagColors.colorTextWhite,
      ),
      dividerThickness: 0,
    );

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth),
        child: Theme(
          data: ThemeData(
            dividerColor: TagColors.colorTextWhite,
            dataTableTheme: dataTableTheme,
          ),
          child: PaginatedDataTable(
            headingRowHeight: 42,
            dataRowHeight: 35,
            columns: columns,
            source: source,
          ),
        ),
      ),
    );
  }
}

class ClassroomDatatable extends DataTableSource {
  final List<Classroom> data;

  ClassroomDatatable({
    @required this.data,
  });

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].stageId.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
