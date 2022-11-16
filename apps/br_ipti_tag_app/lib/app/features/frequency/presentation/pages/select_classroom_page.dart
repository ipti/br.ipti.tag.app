import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import '../cubit/frequency_cubit.dart';
import '../cubit/frequency_state.dart';

class FrequencySelectClassroomPage extends StatefulWidget {
  const FrequencySelectClassroomPage({super.key, this.title = "Frequência"});

  final String title;

  @override
  State<FrequencySelectClassroomPage> createState() =>
      _FrequencySelectClassroomPageState();
}

class _FrequencySelectClassroomPageState
    extends State<FrequencySelectClassroomPage> {
  final controller = Modular.get<FrequencyCubit>();

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: "Frequencia",
      path: const [AppRoutes.frequencia],
      onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
      description: "",
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
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
                        "selectDiscipline",
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
