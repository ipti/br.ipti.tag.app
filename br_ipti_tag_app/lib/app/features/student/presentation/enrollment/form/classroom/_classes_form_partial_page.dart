import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_classroom_bloc.dart';
import 'bloc/enrollment_classroom_states.dart';

class ClassesFormPage extends StatefulWidget {
  const ClassesFormPage({Key? key}) : super(key: key);

  @override
  ClassesFormPageState createState() => ClassesFormPageState();
}

const heading = Heading(text: "Turma", type: HeadingType.Title3);

class ClassesFormPageState extends State<ClassesFormPage> {
  final controller = Modular.get<EnrollmentClassroomBloc>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget selectClass(int? classId) => TagDropdownField(
          label: 'Turma',
          items: controller.classesItems,
          value: classId,
          onChanged: controller.setStudentClass,
        );

    return BlocBuilder<EnrollmentClassroomBloc, EnrollmentClassroomState>(
        bloc: controller,
        builder: (context, state) {
          if (state is EnrollmentState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  withPadding(heading),
                  withPadding(selectClass(state.classroomId)),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
