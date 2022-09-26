import 'package:br_ipti_tag_app/app/shared/util/enums/status.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../domain/entities/classroom_entity.dart';
import 'bloc/classroom_list_bloc.dart';
import 'bloc/classroom_list_states.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key? key, this.title = 'Listagem de Turmas'})
      : super(key: key);

  final String title;

  @override
  ClassroomPageState createState() => ClassroomPageState();
}

class ClassroomPageState
    extends ModularState<ClassroomPage, ClassroomListBloc> {
  @override
  void initState() {
    controller.fetchListClassroomsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "",
      path: ["Turmas", widget.title],
      actionsHeader: _SliverHeaderActionDelegate(
        actionsHeader: const _Actions(),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: BlocBuilder<ClassroomListBloc, ClassroomListState>(
              bloc: controller,
              builder: (context, state) {
                Widget stateWidget = TagEmpty(
                  onPressedRetry: () => controller.fetchListClassroomsEvent(),
                );
                switch (state.status) {
                  case Status.loading:
                    stateWidget =
                        const Center(child: CircularProgressIndicator());
                    break;
                  case Status.success:
                    if (state.classrooms.isEmpty) break;
                    stateWidget = TagDataTable(
                      onTapRow: (index) => Modular.to.pushNamed(
                        "updatePage",
                        arguments: state.classrooms[index],
                      ),
                      columns: const [
                        DataColumn(label: Text("Nome")),
                        DataColumn(label: Text("Etapa")),
                        DataColumn(label: Text("Horário ")),
                      ],
                      source: ClassroomDatatable(
                        data: state.classrooms,
                      ),
                    );
                    break;
                  default:
                }
                return stateWidget;
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: TagButton(
            text: "Criar turma",
            onPressed: () => Modular.to.pushNamed("create"),
          ),
        ),
      ],
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
      DataCell(Text(data[index].name.toUpperCase())),
      DataCell(Text(data[index].stage)),
      DataCell(Text('${data[index].startTime} - ${data[index].endTime}')),
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
  _SliverHeaderActionDelegate({
    required this.actionsHeader,
  });

  final Widget actionsHeader;

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: actionsHeader,
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
