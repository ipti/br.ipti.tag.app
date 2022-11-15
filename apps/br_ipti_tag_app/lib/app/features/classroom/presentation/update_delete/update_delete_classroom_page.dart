import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/classroom_update_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/cubit/tab_controller_cubit.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_student_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_teacher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import 'cubit/tab_controller_state.dart';

class UpdateDeleteClassroomPage extends StatefulWidget {
  const UpdateDeleteClassroomPage({
    super.key,
    required this.classroomEntity,
    this.title = "Atualizar Turmas",
  });

  final ClassroomEntity? classroomEntity;
  final String title;

  @override
  _UpdateDeleteClassroomPageState createState() =>
      _UpdateDeleteClassroomPageState();
}

class _UpdateDeleteClassroomPageState extends State<UpdateDeleteClassroomPage> {
  final controller = Modular.get<TabControllerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      bloc: controller,
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: TagScaffold(
            menu: const TagVerticalMenu(),
            title: widget.title,
            description: "",
            path: [
              AppRoutes.turmas,
              TagPath("", widget.classroomEntity?.name ?? widget.title),
            ],
            onTapBreadcrumb: (route) =>
                Modular.to.pushNamed(route, forRoot: true),
            tabBar: TabBar(
              isScrollable: true,
              labelColor: TagColors.colorBaseProductDark,
              indicatorColor: TagColors.colorBaseProductDark,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              onTap: (value) {
                controller.valueChanged(value: value);
              },
              tabs: const [
                Tab(
                  child: Text("Dados da Turma"),
                ),
                Tab(
                  child: Text("Professor"),
                ),
                Tab(
                  child: Text("Alunos"),
                ),
              ],
            ),
            body: _returnPage(
              state.value,
              widget.classroomEntity,
            ),
          ),
        );
      },
    );
  }
}

Widget _returnPage(
  int index,
  ClassroomEntity? classroomEntity,
) {
  switch (index) {
    case 0:
      return ClassroomBasicDataForm(
        classroomEntity: classroomEntity,
      );
    case 1:
      return ClassroomTeacherPage(
        classroomId: classroomEntity!.id,
      );
    default:
      return const ClassroomStudentPage();
  }
}
