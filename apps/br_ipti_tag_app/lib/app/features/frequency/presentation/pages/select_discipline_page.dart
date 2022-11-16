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
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.fetchListDisciplinesEvent();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: widget.title,
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
                        "frequencia",
                        arguments: {
                          "classroom": widget.classroom,
                          "discipline": state.disciplines[index],
                        },
                      ),
                      columns: const [
                        DataColumn(
                          label: Text("Nome"),
                        ),
                      ],
                      source: DisciplineDatatable(
                        data: state.disciplines,
                      ),
                    );
                  default:
                    return TagEmpty(
                      onPressedRetry: () =>
                          controller.fetchListDisciplinesEvent(),
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

class DisciplineDatatable extends DataTableSource {
  DisciplineDatatable({
    required this.data,
  });

  final List<EdcensoDiscipline> data;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
        data[index].name,
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
