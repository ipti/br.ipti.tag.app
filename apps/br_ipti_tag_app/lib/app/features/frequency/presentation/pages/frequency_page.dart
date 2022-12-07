import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/cubit/frequency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import '../cubit/frequency_cubit.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({
    super.key,
    this.title = "Frequência",
  });

  final String title;

  @override
  State<FrequencyPage> createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  final controller = Modular.get<FrequencyCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.fetchListClassroomsEvent();
    controller.fetchListDisciplinesEvent();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: "Frequencia",
      path: const [
        AppRoutes.frequencia,
      ],
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
                    return _FormFilter(
                      classrooms: state.classrooms,
                      disciplines: state.disciplines,
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

class _FormFilter extends StatelessWidget {
  const _FormFilter({
    Key? key,
    required this.classrooms,
    required this.disciplines,
  }) : super(key: key);

  final List<ClassroomEntity> classrooms;
  final List<EdcensoDiscipline> disciplines;

  @override
  Widget build(BuildContext context) {
    final classroomsItens = {for (var c in classrooms) c: c.name};
    final disciplinesItens = {for (var d in disciplines) d: d.name};

    return RowToColumn(
      children: [
        Flexible(
          child: TagDropdownField<ClassroomEntity>(
            onChanged: (e) => log(e.toString()),
            label: "Turma",
            items: classroomsItens,
          ),
        ),
        Flexible(
          child: TagDropdownField<EdcensoDiscipline>(
            onChanged: (e) => log(e.toString()),
            label: "Disciplinas",
            items: disciplinesItens,
          ),
        ),
      ],
    );
  }
}

class StudentsDatatable extends DataTableSource {
  StudentsDatatable({
    required this.data,
  });

  final List<StudentIdentification> data;

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
