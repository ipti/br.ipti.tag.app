import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/student_list_bloc.dart';
import 'bloc/student_list_states.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, this.title = 'Alunos'}) : super(key: key);

  final String title;

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends ModularState<StudentPage, StudentListBloc> {
  final session = Modular.get<SessionBloc>();

  @override
  void initState() {
    controller.fetchListStudentsEvent();

    session.stream.listen((state) {
      controller.fetchListStudentsEvent();
    });

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
        const _Actions(),
        const SizedBox(height: 30),
        BlocBuilder<StudentListBloc, StudentListState>(
          bloc: controller,
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
              case Status.loading:
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case Status.failure:
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(state.error!),
                  ),
                );
              case Status.success:
                return TagDataTable(
                  onTapRow: (index) => Modular.to.pushReplacementNamed(
                    "matricula/edit",
                    arguments: state.students[index],
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Nome",
                        style: TagTextStyles.textTableColumnHeader,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Data de Nascimento",
                        style: TagTextStyles.textTableColumnHeader,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Nome completo do responsável",
                        style: TagTextStyles.textTableColumnHeader,
                      ),
                    ),
                  ],
                  source: StudentDatatable(
                    data: state.students,
                  ),
                );
            }
          },
        )
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return RowToColumn(
      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: isDesktop ? FlexFit.loose : FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TagButton(
              text: "Matricula",
              onPressed: () => Modular.to.pushReplacementNamed("matricula/"),
            ),
          ),
        ),
        Flexible(
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: TagLinkButton(
                    text: "Matricula rápida",
                    onPressed: () => Modular.to.pushNamed("matricula-rapida"),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: TagLinkButton(
                    text: "Matricula em grupo",
                    onPressed: () => Modular.to.pushNamed("matricula-rapida"),
                  ),
                ),
              ),
            ],
          ),
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
    return DataRow(
      cells: [
        DataCell(
          ToggleMobileDesktop(
            desktop: Text(data[index].name!.toUpperCase()),
            mobile: Text(
              data[index].name!.toUpperCase(),
              style: TagTextStyles.textTableColumnHeader,
            ),
          ),
        ),
        DataCell(Text(data[index].birthday ?? "")),
        DataCell(Text(data[index].responsableName ?? "")),
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
