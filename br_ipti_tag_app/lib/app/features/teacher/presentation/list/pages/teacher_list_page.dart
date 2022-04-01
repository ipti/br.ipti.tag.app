import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_state.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, this.title = 'Professores'}) : super(key: key);

  final String title;

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends ModularState<TeacherPage, TeacherListBloc> {
  @override
  void initState() {
    controller.fetchListTeachersEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Professores", widget.title],
      body: <Widget>[
        SizedBox(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minWidth: 120),
                child: TagButton(
                  text: "Adicionar professores",
                  onPressed: () => Modular.to.pushNamed("cadastrar"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<TeacherListBloc, TeacherListState>(
          bloc: controller,
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return TagDataTable(
              columns: const [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("CPF")),
                DataColumn(label: Text("Data de nacimento")),
                DataColumn(label: Text("")),
              ],
              source: TeacherDatatable(
                data: state.teachers,
              ),
            );
          },
        )
      ],
    );
  }
}

class TeacherDatatable extends DataTableSource {
  TeacherDatatable({
    required this.data,
  });

  final List<Teacher> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].cpf ?? " - ")),
      DataCell(Text(data[index].birthday?.toString() ?? " - ")),
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
