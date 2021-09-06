import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

import 'bloc/classes_form_bloc.dart';
import 'bloc/classes_form_states.dart';

class ClassesFormPage extends StatefulWidget {
  const ClassesFormPage({Key key}) : super(key: key);

  @override
  ClassesFormPageState createState() => ClassesFormPageState();
}

const heading = Heading(text: "Endereço", type: HeadingType.Title2);

class ClassesFormPageState extends State<ClassesFormPage> {
  ClassesFormBloc controller = Modular.get<ClassesFormBloc>();
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget selectClass(int classId) => TagDropdownField(
          label: 'Turma',
          items: controller.classesItems,
          value: classId,
          onChanged: controller.setStudentClass,
        );

    return BlocBuilder<ClassesFormBloc, ClassesFormState>(
        bloc: controller,
        builder: (context, state) {
          if (state is ClassesFormState) {
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
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
