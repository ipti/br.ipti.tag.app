import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/classroom_update_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_student_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_teacher_page.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';
import 'bloc/classroom_update_bloc.dart';

class ClassroomUpdateDeletePage extends StatefulWidget {
  final String title;

  final String id;
  const ClassroomUpdateDeletePage({
    Key? key,
    this.title = 'Atualizar Turma',
    this.id = '',
  }) : super(key: key);

  @override
  ClassroomUpdateDeletePageState createState() =>
      ClassroomUpdateDeletePageState();
}

class ClassroomUpdateDeletePageState
    extends ModularState<ClassroomUpdateDeletePage, ClassroomUpdateDeleteBloc> {
  @override
  Widget build(BuildContext context) {
    int _value = 0;
    return DefaultTabController(
      length: 3,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        aside: Container(),
        title: widget.title,
        description: "",
        path: ["Turmas", widget.title],
        body: <Widget>[
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            onTap: (value) {
              setState(() {
                _value = value;
              });
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
          _returnPage(_value),
        ],
      ),
    );
  }
}

Widget _returnPage(int index) {
  switch (index) {
    case 0:
      return const ClassroomBasicDataForm();
    case 1:
      return const ClassroomStudentPage();
    default:
      return const ClassroomTeacherPage();
  }
}
