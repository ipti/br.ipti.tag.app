import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../cubit/frequency_cubit.dart';

class FrequencySelectDisciplinePage extends StatefulWidget {
  const FrequencySelectDisciplinePage({
    super.key,
    this.title = "Disciplina",
    required this.classroom,
  });

  final String title;
  final ClassroomEntity classroom;

  @override
  State<FrequencySelectDisciplinePage> createState() =>
      _FrequencySelectDisciplinePageState();
}

class _FrequencySelectDisciplinePageState
    extends State<FrequencySelectDisciplinePage> {
  final controller = Modular.get<FrequencyCubit>();

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: widget.title,
      path: ["Frequência", widget.classroom.name, widget.title],
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
                        arguments: state.classrooms[index],
                      ),
                      columns: const [
                        DataColumn(
                          label: Text("Nome"),
                        ),
                        DataColumn(
                          label: Text("Etapa"),
                        ),
                        DataColumn(
                          label: Text("Horário "),
                        ),
                      ],
                      source: ClassroomDatatable(
                        data: state.classrooms,
                      ),
                    );
                  default:
                    return TagEmpty(
                      onPressedRetry: () =>
                          controller.fetchListClassroomsEvent(),
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

class ClassroomDatatable extends DataTableSource {
  ClassroomDatatable({
    required this.data,
  });

  final List<ClassroomEntity> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        data[index].name.toUpperCase(),
      )),
      DataCell(
        Text(data[index].stage),
      ),
      DataCell(
        Text('${data[index].startTime} - ${data[index].endTime}'),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
