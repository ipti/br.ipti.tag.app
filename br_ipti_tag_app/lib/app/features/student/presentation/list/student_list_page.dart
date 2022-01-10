import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../domain/entities/student.dart';
import 'bloc/student_list_bloc.dart';
import 'bloc/student_list_states.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, this.title = 'Alunos'}) : super(key: key);

  final String title;

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends ModularState<StudentPage, StudentListBloc> {
  @override
  void initState() {
    controller.fetchListStudentsEvent();
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
              Container(
                padding: const EdgeInsets.all(8),
                width: 120,
                child: TagButton(
                  text: "Matricula",
                  onPressed: () => Modular.to.pushNamed("matricula"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 180,
                child: TagButton(
                  text: "Matricula em grupo",
                  onPressed: () => Modular.to.pushNamed("matricula-rapida"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 180,
                child: TagLinkButton(
                  text: "Matricula rápida",
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
            if (state.loading) {
              return const CircularProgressIndicator();
            } else if (state.message.isNotEmpty) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text(state.message),
                ),
              );
            }
            return TagDataTable(
              columns: const [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de Nascimento")),
                DataColumn(label: Text("Nome completo do responsável")),
                DataColumn(label: Text("")),
              ],
              source: StudentDatatable(
                data: state.students,
              ),
            );
          },
        )
      ],
    );
  }
}

class StudentDatatable extends DataTableSource {
  StudentDatatable({
    required this.data,
  });

  final List<Student> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name!.toUpperCase())),
      DataCell(Text(data[index].birthday ?? "")),
      DataCell(Text(data[index].responsable?.name ?? "")),
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
