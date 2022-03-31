import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/classroom_update_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/cubit/tab_controller_cubit.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_student_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_teacher_page.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/components/components.dart';
import 'package:tag_ui/design_tokens/colors.dart';

class UpdateDeleteClassroomPage extends StatefulWidget {
  const UpdateDeleteClassroomPage({
    Key? key,
    @required this.classroomEntity,
  }) : super(key: key);
  final ClassroomEntity? classroomEntity;
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
          child: TagDefaultPage(
            menu: const TagVerticalMenu(),
            aside: Container(),
            title: 'Atualizar Turmas',
            description: "",
            path: const ["Turmas", 'Atualizar Turmas'],
            body: <Widget>[
              TabBar(
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
              _returnPage(
                state.value,
                widget.classroomEntity,
              ),
            ],
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
      return const ClassroomStudentPage();
    default:
      return const ClassroomTeacherPage();
  }
}
