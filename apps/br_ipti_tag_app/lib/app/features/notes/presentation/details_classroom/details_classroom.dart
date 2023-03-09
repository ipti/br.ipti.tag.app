// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    const classroomTest = <ClassroomTest>[ClassroomTest(name: "name", studentClassRoom: StudentClassRoom(name: "jonny"))];

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
  final StudentClassRoom studentClassRoom;
  final String name;
}

class StudentClassRoom {
 

  const StudentClassRoom(
    this.name,
  );

  final String name;
}
