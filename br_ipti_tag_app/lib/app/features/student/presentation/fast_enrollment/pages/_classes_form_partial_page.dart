import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/bloc/fast_enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/bloc/fast_enrollment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class ClassesFormPage extends StatefulWidget {
  const ClassesFormPage({Key? key}) : super(key: key);

  @override
  ClassesFormPageState createState() => ClassesFormPageState();
}

const heading = Heading(text: "Turma", type: HeadingType.Title2);

class ClassesFormPageState extends State<ClassesFormPage> {
  final controller = Modular.get<FastEnrollmentBloc>();

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

    return BlocBuilder<FastEnrollmentBloc, FastEnrollmentState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  withPadding(heading),
                  withPadding(selectClass(state.studentClass)),
                ],
              ),
            ),
          );
        });
  }
}
