import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/validators/validators.dart';
import 'package:br_ipti_tag_app/app/core/widgets/submit_buttons_row/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_classroom_bloc.dart';
import 'bloc/enrollment_classroom_states.dart';

class ClassesFormPage extends StatefulWidget {
  const ClassesFormPage({
    super.key,
    this.model,
    this.editMode = EditMode.Create,
  });

  final StudentEnrollment? model;
  final EditMode editMode;

  @override
  ClassesFormPageState createState() => ClassesFormPageState();
}

const heading = Heading(text: "Turma", type: HeadingType.Title3);

class ClassesFormPageState extends State<ClassesFormPage> {
  final controller = Modular.get<EnrollmentClassroomBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) controller.loadStudentEnrollment(widget.model!);
    controller.fetchClassrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    return SingleChildScrollView(
      child: BlocBuilder<EnrollmentClassroomBloc, EnrollmentClassroomState>(
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
                        child: _AdmissionDateField(
                          schoolAdmissionDate: state.schoolAdmissionDate,
                          controller: controller,
                        ),
                      ),
                      Flexible(
                        child: _AdmissionTypeField(
                          studentEntryForm: state.studentEntryForm,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: _ClassroomField(
                          classroomId: state.classroomId,
                          controller: controller,
                        ),
                      ),
                      Flexible(
                        child: _CurrentStageField(
                          currentStageSituation: state.currentStageSituation,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: _UnifiedClassField(
                          unifiedClass: state.unifiedClass,
                          controller: controller,
                        ),
                      ),
                      Flexible(
                        child: _PreviousStageField(
                          previousStageSituation: state.previousStageSituation,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: _StageField(
                          stage: state.stage,
                          controller: controller,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SubmitButtonsRow(
                    onSubmitAndGo: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submit(widget.editMode);
                      }
                    },
                    onSubmitAndStay: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submit(widget.editMode);
                      }
                    },
                  ),
                  // withPadding(selectClass(state.classroomId),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AdmissionDateField extends StatelessWidget {
  const _AdmissionDateField({
    this.schoolAdmissionDate,
    required this.controller,
  });

  final String? schoolAdmissionDate;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDatePickerField(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_ADDMISSIONDATE"),
      label: "Data de ingresso na escola",
      hint: "__/__/____",
      value: schoolAdmissionDate,
      onChanged: controller.setSchoolAdmissionDate,
      inputType: TextInputType.number,
    );
  }
}

class _AdmissionTypeField extends StatelessWidget {
  const _AdmissionTypeField({
    this.studentEntryForm,
    required this.controller,
  });

  final AdmissionType? studentEntryForm;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<AdmissionType>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_ADDMISSIONTYPE"),
      label: "Tipo de matrícula",
      value: studentEntryForm,
      onChanged: controller.setAdmissionType,
      items: Map.fromEntries(
        AdmissionType.values.map(
          (e) => MapEntry(e, e.name),
        ),
      ),
    );
  }
}

class _ClassroomField extends StatelessWidget {
  const _ClassroomField({
    this.classroomId,
    required this.controller,
  });

  final String? classroomId;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    final items = controller.state.classrooms;

    return TagDropdownField<String>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_CLASSROOM"),
      label: "Turma",
      value: classroomId,
      onChanged: controller.setStudentClass,
      validator: requiredValidator,
      items: Map.fromEntries(
        items.map(
          (e) => MapEntry(e.id, e.name),
        ),
      ),
    );
  }
}

class _CurrentStageField extends StatelessWidget {
  const _CurrentStageField({
    this.currentStageSituation,
    required this.controller,
  });

  final CurrentStageSituation? currentStageSituation;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<CurrentStageSituation>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_CURRENTSTAGE"),
      label: "Situação na série/etapa atual",
      value: currentStageSituation,
      onChanged: controller.setCurrentStageSituation,
      items: Map.fromEntries(
        CurrentStageSituation.values.map(
          (e) => MapEntry(e, e.name),
        ),
      ),
    );
  }
}

class _UnifiedClassField extends StatelessWidget {
  const _UnifiedClassField({
    this.unifiedClass,
    required this.controller,
  });

  final UnifiedClass? unifiedClass;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<UnifiedClass>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_UNIFIEDCLASS"),
      label: "Turma Unificada",
      value: unifiedClass,
      onChanged: controller.setUnifiedClass,
      items: Map.fromEntries(
        UnifiedClass.values.map(
          (e) => MapEntry(e, e.name),
        ),
      ),
    );
  }
}

class _PreviousStageField extends StatelessWidget {
  const _PreviousStageField({
    this.previousStageSituation,
    required this.controller,
  });

  final PreviousStageSituation? previousStageSituation;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<PreviousStageSituation>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_PREVIOUSSTAGE"),
      label: "Situação no ano anterior",
      value: previousStageSituation,
      onChanged: controller.setPreviousStageSituation,
      items: Map.fromEntries(
        PreviousStageSituation.values.map(
          (e) => MapEntry(e, e.name),
        ),
      ),
    );
  }
}

class _StageField extends StatelessWidget {
  const _StageField({
    this.stage,
    required this.controller,
  });

  final Stage? stage;
  final EnrollmentClassroomBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<Stage>(
      key: const Key("STUDENT_ENROLLMENT_CLASSROOM_STAGE"),
      label: "Etapa",
      value: stage,
      onChanged: controller.setStage,
      items: Map.fromEntries(
        Stage.values.map(
          (e) => MapEntry(e, e.name),
        ),
      ),
    );
  }
}
