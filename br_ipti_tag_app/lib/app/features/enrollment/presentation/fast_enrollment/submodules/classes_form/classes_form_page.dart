import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'bloc/classes_form_bloc.dart';
import 'bloc/classes_form_states.dart';

class ClassesFormPage extends StatefulWidget {
  ClassesFormPage({Key key}) : super(key: key);

  @override
  ClassesFormPageState createState() => ClassesFormPageState();
}

const padding = EdgeInsets.all(8.0);

final withPadding = (widget) => Padding(padding: padding, child: widget);

final heading = Heading(text: "Endereço", type: HeadingType.Title2);

class ClassesFormPageState extends State<ClassesFormPage> {
  ClassesFormBloc controller = Modular.get<ClassesFormBloc>();
  @override
  Widget build(BuildContext context) {
    final selectClass = (initialValue) => TagDropdownField(
          label: 'Turma',
          items: controller.classesItems,
          value: initialValue,
          onChanged: controller.setStudentClass,
        );

    return BlocConsumer<ClassesFormBloc, ClassesFormState>(
        bloc: controller,
        listener: (_, state) => print(state.toString()),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
