import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
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
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Início", widget.title],
      body: <Widget>[
        RowToColumn(
          columnCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              fit: isDesktop ? FlexFit.loose : FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TagButton(
                  text: "Adicionar professor",
                  onPressed: () => Modular.to.pushNamed("adicionar/"),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        BlocConsumer<TeacherListBloc, TeacherListState>(
          listener: (context, state) {
            if (state is FailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: TagColors.colorRedDark,
                  content: Text(state.message),
                ),
              );
            }
          },
          bloc: controller,
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return TagDataTable(
              bodyHeight: 420,
              onTapRow: (row) => Modular.to.pushNamed("/edit", arguments: row),
              columns: const [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Email")),
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

  final List<Instructor> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].name!.toUpperCase())),
      DataCell(Text(data[index].email ?? " - ")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
