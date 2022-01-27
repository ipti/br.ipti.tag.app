import 'package:br_ipti_tag_app/app/shared/widgets/header/header_desktop.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../domain/entities/classroom.dart';
import 'bloc/classroom_list_bloc.dart';
import 'bloc/classroom_list_states.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key? key, this.title = 'Listagem de Turmas'})
      : super(key: key);

  final String title;

  @override
  ClassroomPageState createState() => ClassroomPageState();
}

class ClassroomPageState
    extends ModularState<ClassroomPage, ClassroomListBloc> {
  @override
  void initState() {
    controller.fetchListClassroomsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      header: const HeaderDesktop(),
      title: widget.title,
      description: "",
      path: ["Turmas", widget.title],
      body: <Widget>[
        SizedBox(
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                  minWidth: 100,
                ),
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
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }
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
          },
        )
      ],
    );
  }
}

class ClassroomDatatable extends DataTableSource {
  ClassroomDatatable({
    required this.data,
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
