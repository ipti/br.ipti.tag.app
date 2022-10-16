import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_state.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key, this.title = 'Professores'});

  final String title;

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends State<TeacherPage> {
  final controller = Modular.get<TeacherListBloc>();
  @override
  void initState() {
    controller.fetchListTeachersEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Início", widget.title],
      actionsHeader: _SliverHeaderActionDelegate(),
      body: BlocConsumer<TeacherListBloc, TeacherListState>(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return TagDataTable(
            onTapRow: (row) => Modular.to.pushNamed(
              "registro/editar",
              arguments: state.teachers[row],
            ),
            columns: const [
              DataColumn(
                label: Text("Nome"),
              ),
              DataColumn(
                label: Text("Email"),
              ),
            ],
            source: TeacherDatatable(
              data: state.teachers,
            ),
          );
        },
      ),
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
      DataCell(Text(
        data[index].name!.toUpperCase(),
      )),
      DataCell(
        Text(data[index].email ?? " - "),
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

class _SliverHeaderActionDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return Container(
      height: maxExtent,
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            fit: isDesktop ? FlexFit.loose : FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TagButton(
                text: "Adicionar professor",
                onPressed: () => Modular.to.pushNamed("registro/"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  bool shouldRebuild(_SliverHeaderActionDelegate oldDelegate) {
    return false;
  }
}
