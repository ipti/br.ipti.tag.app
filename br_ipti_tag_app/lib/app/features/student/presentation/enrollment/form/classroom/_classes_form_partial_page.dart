import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget selectClass(String? classId) => TagDropdownField(
          label: 'Turma',
          items: controller.classesItems,
          value: classId,
          onChanged: controller.setStudentClass,
        );

    return BlocBuilder<EnrollmentClassroomBloc, EnrollmentClassroomState>(
        bloc: controller,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  withPadding(heading),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: TagDatePickerField(
                          onChanged: (String value) => print(value),
                          label: "Data de ingresso na escola",
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<AdmissionType>(
                          onChanged: (AdmissionType value) => print(value.name),
                          label: "Tipo de matrícula",
                          items: Map.fromEntries(
                            AdmissionType.values
                                .map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: TagDropdownField<String>(
                          onChanged: (String value) => print(value),
                          label: "Turma",
                          items: controller.classesItems,
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<CurrentStageSituation>(
                          onChanged: (CurrentStageSituation value) =>
                              print(value.name),
                          label: "Situação na série/etapa atual",
                          items: Map.fromEntries(
                            CurrentStageSituation.values
                                .map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: TagDropdownField<UnifiedClass>(
                          onChanged: (UnifiedClass value) => print(value.name),
                          label: "Turma Unificada",
                          items: Map.fromEntries(
                            UnifiedClass.values.map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<PreviousStageSituation>(
                          onChanged: (PreviousStageSituation value) =>
                              print(value.name),
                          label: "Situação no ano anterior",
                          items: Map.fromEntries(
                            PreviousStageSituation.values
                                .map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: TagDropdownField<Stage>(
                          onChanged: (Stage value) => print(value.name),
                          label: "Etapa",
                          items: Map.fromEntries(
                            Stage.values.map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  SubmitButtonsRow(
                    onSubmitAndGo: () {
                      if (_formKey.currentState!.validate()) {
                        // controller.submitAddressForm();
                      }
                    },
                    onSubmitAndStay: () {
                      if (_formKey.currentState!.validate()) {
                        // controller.submitPersonalForm();
                      }
                    },
                  ),
                  // withPadding(selectClass(state.classroomId)),
                ],
              ),
            ),
          );
        });
  }
}
