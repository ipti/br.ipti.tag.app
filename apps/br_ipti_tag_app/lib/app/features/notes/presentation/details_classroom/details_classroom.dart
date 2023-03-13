// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:br_ipti_tag_app/app/features/notes/presentation/widget/students_list.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../core/util/routes/routes.dart';
import '../../../../core/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/widgets/menu/vertical_menu.dart';

class DetailsClassroom extends StatefulWidget {
  const DetailsClassroom({super.key, this.title = "Notas"});

  final String title;

  @override
  State<DetailsClassroom> createState() => _DetailsClassroomState();
}

class _DetailsClassroomState extends State<DetailsClassroom> {
  @override
  Widget build(BuildContext context) {
    const alunos = <StudentClassRoom>[StudentClassRoom(name: "jonny"), StudentClassRoom(name: "aluno2"), StudentClassRoom(name: "aluno4")];
    const classroomTest = <ClassroomTest>[
      ClassroomTest(studentClassRoom: alunos, name: "name"),
    ];

    return TagScaffold(
      title: widget.title,
      path: const [AppRoutes.notes],
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TagDropdownField(
              onChanged: (r) => {},
              label: "turmas",
              items: Map.fromEntries(
                classroomTest.map(
                  (e) => MapEntry(e, e.name),
                ),
              ),
            ),

            ListView.builder(
              itemCount: alunos.length,
              shrinkWrap: true, 
              itemBuilder: (BuildContext context, int index) {
                log(alunos.toString());
                return StudentList(student: alunos[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ClassroomTest {
  const ClassroomTest({
    required this.studentClassRoom,
    required this.name,
  });
  final List<StudentClassRoom> studentClassRoom;
  final String name;
}

class StudentClassRoom {
  const StudentClassRoom({
    required this.name,
  });

  final String name;
}
