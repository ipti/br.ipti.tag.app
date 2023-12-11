import 'package:br_ipti_tag_biometry_app/core/status_page.dart';
import 'package:br_ipti_tag_biometry_app/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/student_list_bloc.dart';
import 'bloc/student_list_states.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key, this.title = 'Alunos'});

  final String title;

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends State<StudentPage> {
  final controller = Modular.get<StudentListBloc>();
  final session = Modular.get<AuthRepository>();

  @override
  void initState() {
    controller.fetchListStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBar(),
          BlocBuilder<StudentListBloc, StudentListState>(
            bloc: controller,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                case Status.loading:
                  return const SizedBox(height: 200, child: Center(child: CircularProgressIndicator()));
                case Status.success:
                  return TagDataTable(
                    onTapRow: (index) => Modular.to.pushNamed("/biometrics/sign/${state.students[index].id}"),
                    columns: const [
                      DataColumn(
                        label: Text("Nome", style: TagTextStyles.textTableColumnHeader),
                      ),
                      DataColumn(
                        label: Text("Data de Nascimento", style: TagTextStyles.textTableColumnHeader),
                      ),
                      DataColumn(
                        label: Text("Nome completo do responsável", style: TagTextStyles.textTableColumnHeader),
                      ),
                    ],
                    source: StudentDatatable(
                      data: state.students,
                    ),
                  );
                default:
                  return TagEmpty(
                    onPressedRetry: () {
                      controller.fetchListStudents();
                    },
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

class StudentDatatable extends DataTableSource {
  StudentDatatable({
    required this.data,
  });

  final List<StudentIdentification> data;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          ToggleMobileDesktop(
            desktop: Text(
              (data[index].name ?? "Não definido").toUpperCase(),
            ),
            mobile: Text(
              (data[index].name ?? "Não definido").toUpperCase(),
              style: TagTextStyles.textTableColumnHeader,
            ),
          ),
        ),
        DataCell(
          Text(data[index].birthday ?? "Não definido"),
        ),
        DataCell(
          Text(data[index].responsableName ?? ""),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
