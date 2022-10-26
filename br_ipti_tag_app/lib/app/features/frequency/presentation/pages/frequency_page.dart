import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../cubit/frequency_cubit.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({
    super.key,
    this.title = "Frequência",
    required this.classroom,
    required this.discipline,
  });

  final String title;
  final ClassroomEntity classroom;
  final EdcensoDiscipline discipline;

  @override
  State<FrequencyPage> createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  final controller = Modular.get<FrequencyCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.fetchListStudentEvent();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: "Frequencia",
      path: ["Frequencia", widget.classroom.name, widget.discipline.name],
      description: "",
      menu: const TagVerticalMenu(),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: BlocBuilder<FrequencyCubit, FrequencyState>(
              bloc: controller,
              builder: (context, state) {
                switch (state.status) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    return TagDataTable(
                      onTapRow: (index) => Modular.to.pushNamed(
                        "updatePage",
                        arguments: state.students[index],
                      ),
                      columns: const [
                        DataColumn(
                          label: Text("Nome"),
                        ),
                      ],
                      source: StudentsDatatable(
                        data: state.students,
                      ),
                    );
                  default:
                    return TagEmpty(
                      onPressedRetry: () => controller.fetchListStudentEvent(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudentsDatatable extends DataTableSource {
  StudentsDatatable({
    required this.data,
  });

  final List<Student> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        data[index].name!,
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
