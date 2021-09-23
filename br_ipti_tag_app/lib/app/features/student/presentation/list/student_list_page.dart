import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';

import 'package:meta/meta.dart';

import '../../domain/entities/student.dart';
import 'bloc/student_list_bloc.dart';
import 'bloc/student_list_events.dart';
import 'bloc/student_list_states.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key key, this.title = 'Listagem de Alunos'})
      : super(key: key);

  final String title;

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends ModularState<StudentPage, StudentListBloc> {
  @override
  void initState() {
    controller.add(GetListStudentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Alunos", widget.title],
      body: <Widget>[
        SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: TagButton(
                  text: "Matricula",
                  onPressed: () => Modular.to.pushNamed("matricula-rapida"),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<StudentListBloc, StudentListState>(
          bloc: controller,
          builder: (context, state) {
            if (state is LoadedState) {
              return TagDataTable(
                columns: const [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Etapa")),
                  DataColumn(label: Text("")),
                ],
                source: StudentDatatable(
                  data: state.students,
                ),
              );
            } else if (state is FailedState) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text(state.message),
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

class StudentDatatable extends DataTableSource {
  StudentDatatable({
    @required this.data,
  });

  final List<Student> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].scholarity.toString())),
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
