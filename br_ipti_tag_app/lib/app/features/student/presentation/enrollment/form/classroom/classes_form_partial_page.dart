import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_classroom_bloc.dart';
import 'bloc/enrollment_classroom_states.dart';

class ClassesFormPage extends StatefulWidget {
  const ClassesFormPage({
    Key? key,
    this.model,
    this.editMode = EditMode.Create,
  }) : super(key: key);

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
                          label: "Data de ingresso na escola",
                          hint: "__/__/____",
                          value: state.schoolAdmissionDate,
                          onChanged: controller.setSchoolAdmissionDate,
                          inputType: TextInputType.number,
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<AdmissionType>(
                          label: "Tipo de matrícula",
                          value: state.studentEntryForm,
                          onChanged: controller.setAdmissionType,
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
                          label: "Turma",
                          value: state.classroomId,
                          onChanged: controller.setStudentClass,
                          validator: requiredValidator,
                          items: Map.fromEntries(state.classrooms
                              .map((e) => MapEntry(e.id, e.name))),
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<CurrentStageSituation>(
                          label: "Situação na série/etapa atual",
                          value: state.currentStageSituation,
                          onChanged: controller.setCurrentStageSituation,
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
                          label: "Turma Unificada",
                          value: state.unifiedClass,
                          onChanged: controller.setUnifiedClass,
                          items: Map.fromEntries(
                            UnifiedClass.values.map((e) => MapEntry(e, e.name)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TagDropdownField<PreviousStageSituation>(
                          label: "Situação no ano anterior",
                          value: state.previousStageSituation,
                          onChanged: controller.setPreviousStageSituation,
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
                          label: "Etapa",
                          value: state.stage,
                          onChanged: controller.setStage,
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
                        controller.submit(widget.editMode);
                      }
                    },
                    onSubmitAndStay: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submit(widget.editMode);
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
