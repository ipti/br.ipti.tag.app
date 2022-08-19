import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/submit_buttons_row/submit_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_filiation_bloc.dart';
import 'bloc/enrollment_filiation_states.dart';

class FiliationFormPage extends StatefulWidget {
  const FiliationFormPage({Key? key, this.student}) : super(key: key);
  final Student? student;
  @override
  FiliationFormPageState createState() => FiliationFormPageState();
}

class FiliationFormPageState extends State<FiliationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnrollmentFiliationBloc>();

  @override
  void initState() {
    if (widget.student != null) controller.loadStudent(widget.student!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const headingResponsable =
        Heading(text: "Responsável", type: HeadingType.Title3);
    const headingFiliation1 =
        Heading(text: "Pai do aluno", type: HeadingType.Title3);
    const headingFiliation2 =
        Heading(text: "Mãe do aluno", type: HeadingType.Title3);

    return BlocBuilder<EnrollmentFiliationBloc, EnrollmentFiliationState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    headingResponsable,
                    // Responsable
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _NameResponsableField(
                            name: state.nameResponsable,
                            controller: controller,
                          ),
                        ),
                        Flexible(
                          child: _CpfResponsableField(
                            cpf: state.cpfResponsable,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                            child: _RGResponsableField(
                          rg: state.rgResponsable,
                          controller: controller,
                        )),
                        Flexible(
                          child: _ScholarityResponsableField(
                            scholarity: state.scholarityResponsable,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _JobResponsableField(
                            job: state.jobResponsable,
                            controller: controller,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Filiation1
                    headingFiliation1,
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _NameFilliation1Field(
                            name: state.nameFiliation1,
                            controller: controller,
                          ),
                        ),
                        Flexible(
                          child: _CpfFilliation1Field(
                            cpf: state.cpfFiliation1,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _RGFilliation1Field(
                            rg: state.rgFiliation1,
                            controller: controller,
                          ),
                        ),
                        Flexible(
                          child: _ScholarityFilliation1Field(
                            scholarity: state.scholarityFiliation1,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _JobFilliation1Field(
                            job: state.jobFiliation1,
                            controller: controller,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Filiation2
                    headingFiliation2,
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _NameFilliation2Field(
                            name: state.nameFiliation2,
                            controller: controller,
                          ),
                        ),
                        Flexible(
                          child: _CpfFilliation2Field(
                            cpf: state.cpfFiliation2,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _RGFilliation2Field(
                            rg: state.rgFiliation2,
                            controller: controller,
                          ),
                        ),
                        Flexible(
                          child: _ScholarityFilliation2Field(
                            scholarity: state.scholarityFiliation2,
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: _JobFilliation2Field(
                            job: state.jobFiliation2,
                            controller: controller,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    SubmitButtonsRow(
                      onSubmitAndGo: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitFiliationForm();
                        }
                      },
                      onSubmitAndStay: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitFiliationForm();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _NameResponsableField extends StatelessWidget {
  const _NameResponsableField({
    Key? key,
    this.name,
    required this.controller,
  }) : super(key: key);

  final String? name;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_RESPONSABLE_NAME'),
      label: "Nome",
      hint: "Nome completo",
      onChanged: controller.setNameResponsable,
      value: name,
      validator: MultiValidator([
        requiredValidator,
        onlyLettersValidator,
      ]),
    );
  }
}

class _CpfResponsableField extends StatelessWidget {
  const _CpfResponsableField({
    Key? key,
    this.cpf,
    required this.controller,
  }) : super(key: key);

  final String? cpf;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_RESPONSABLE_CPF'),
      label: "CPF",
      hint: "digite o CPF",
      onChanged: controller.setCpfResponsable,
      formatters: [TagMasks.maskCPF],
      value: cpf,
      validator: MultiValidator([
        requiredValidator,
        cpfValidator,
      ]),
    );
  }
}

class _RGResponsableField extends StatelessWidget {
  const _RGResponsableField({
    Key? key,
    this.rg,
    required this.controller,
  }) : super(key: key);

  final String? rg;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_RESPONSABLE_RG'),
      label: "RG",
      hint: "digite o número do RG",
      onChanged: controller.setRgResponsable,
      value: rg,
      validator: MultiValidator([
        rgValidator,
      ]),
    );
  }
}

class _ScholarityResponsableField extends StatelessWidget {
  const _ScholarityResponsableField({
    Key? key,
    this.scholarity,
    required this.controller,
  }) : super(key: key);

  final int? scholarity;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_RESPONSABLE_SCHOLARITY'),
      label: 'Escolaridade',
      items: controller.scholarityItems,
      value: scholarity,
      onChanged: controller.setScholarityResponsable,
    );
  }
}

class _JobResponsableField extends StatelessWidget {
  const _JobResponsableField({
    Key? key,
    this.job,
    required this.controller,
  }) : super(key: key);

  final String? job;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_RESPONSABLE_JOB'),
      label: "Profissão",
      hint: "Digite a profissão",
      onChanged: controller.setJobResponsable,
      value: job,
    );
  }
}

// Filliation 1

class _NameFilliation1Field extends StatelessWidget {
  const _NameFilliation1Field({
    Key? key,
    this.name,
    required this.controller,
  }) : super(key: key);

  final String? name;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION1_NAME'),
      label: "Nome",
      hint: "Nome completo",
      onChanged: controller.setNameFiliation1,
      value: name,
      validator: MultiValidator([
        onlyLettersValidator,
      ]),
    );
  }
}

class _CpfFilliation1Field extends StatelessWidget {
  const _CpfFilliation1Field({
    Key? key,
    this.cpf,
    required this.controller,
  }) : super(key: key);

  final String? cpf;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION1_CPF'),
      label: "CPF",
      hint: "digite o CPF",
      onChanged: controller.setCpfFiliation1,
      formatters: [TagMasks.maskCPF],
      value: cpf,
      validator: cpfValidator,
    );
  }
}

class _RGFilliation1Field extends StatelessWidget {
  const _RGFilliation1Field({
    Key? key,
    this.rg,
    required this.controller,
  }) : super(key: key);

  final String? rg;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION1_RG'),
      label: "RG",
      hint: "digite o número do RG",
      onChanged: controller.setRgFiliation1,
      value: rg,
      validator: rgValidator,
    );
  }
}

class _ScholarityFilliation1Field extends StatelessWidget {
  const _ScholarityFilliation1Field({
    Key? key,
    this.scholarity,
    required this.controller,
  }) : super(key: key);

  final int? scholarity;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION1_SCHOLARITY'),
      label: 'Escolaridade',
      items: controller.scholarityItems,
      value: scholarity,
      onChanged: controller.setScholarityFiliation1,
    );
  }
}

class _JobFilliation1Field extends StatelessWidget {
  const _JobFilliation1Field({
    Key? key,
    this.job,
    required this.controller,
  }) : super(key: key);

  final String? job;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION1_JOB'),
      label: "Profissão",
      hint: "Digite a profissão",
      onChanged: controller.setJobFiliation1,
      value: job,
    );
  }
}

// Filliation 2

class _NameFilliation2Field extends StatelessWidget {
  const _NameFilliation2Field({
    Key? key,
    this.name,
    required this.controller,
  }) : super(key: key);

  final String? name;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION2_NAME'),
      label: "Nome",
      hint: "Nome completo",
      onChanged: controller.setNameFiliation2,
      value: name,
      validator: onlyLettersValidator,
    );
  }
}

class _CpfFilliation2Field extends StatelessWidget {
  const _CpfFilliation2Field({
    Key? key,
    this.cpf,
    required this.controller,
  }) : super(key: key);

  final String? cpf;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION2_CPF'),
      label: "CPF",
      hint: "digite o CPF",
      onChanged: controller.setCpfFiliation2,
      formatters: [TagMasks.maskCPF],
      value: cpf,
      validator: cpfValidator,
    );
  }
}

class _RGFilliation2Field extends StatelessWidget {
  const _RGFilliation2Field({
    Key? key,
    this.rg,
    required this.controller,
  }) : super(key: key);

  final String? rg;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION2_RG'),
      label: "RG",
      hint: "digite o número do RG",
      onChanged: controller.setRgFiliation2,
      value: rg,
      validator: rgValidator,
    );
  }
}

class _ScholarityFilliation2Field extends StatelessWidget {
  const _ScholarityFilliation2Field({
    Key? key,
    this.scholarity,
    required this.controller,
  }) : super(key: key);

  final int? scholarity;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION2_SCHOLARITY'),
      label: 'Escolaridade',
      items: controller.scholarityItems,
      value: scholarity,
      onChanged: controller.setScholarityFiliation1,
    );
  }
}

class _JobFilliation2Field extends StatelessWidget {
  const _JobFilliation2Field({
    Key? key,
    this.job,
    required this.controller,
  }) : super(key: key);

  final String? job;
  final EnrollmentFiliationBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_FILLIATION_FILLIATION2_JOB'),
      label: "Profissão",
      hint: "Digite a profissão",
      onChanged: controller.setJobFiliation2,
      value: job,
    );
  }
}
