import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

    Widget inputName(String? name, Function(String) onChanged) => TagTextField(
          label: "Nome",
          hint: "Nome completo",
          onChanged: onChanged,
          value: name,
          validator: requiredValidator,
        );

    Widget inputCPF(String? cpf, Function(String) onChanged) => TagTextField(
          label: "CPF",
          hint: "digite o CPF",
          onChanged: onChanged,
          formatters: [TagMasks.maskCPF],
          value: cpf,
          validator: requiredValidator,
        );

    Widget inputRG(String? rg, Function(String) onChanged) => TagTextField(
          label: "RG",
          hint: "digite o número do RG",
          onChanged: onChanged,
          value: rg,
          validator: requiredValidator,
        );

    Widget selectScholarity(int? classId, Function(int) onChanged) =>
        TagDropdownField(
          label: 'Escolaridade',
          items: controller.scholarityItems,
          value: classId,
          onChanged: onChanged,
        );

    Widget inputJob(String? job, Function(String) onChanged) => TagTextField(
          label: "Profissão",
          hint: "Digite a profissão",
          onChanged: onChanged,
          value: job,
          validator: requiredValidator,
        );

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
                            child: inputName(
                          state.nameResponsable,
                          controller.setNameResponsable,
                        )),
                        Flexible(
                            child: inputCPF(
                          state.cpfResponsable,
                          controller.setCpfResponsable,
                        )),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                            child: inputRG(
                          state.rgResponsable,
                          controller.setRgResponsable,
                        )),
                        Flexible(
                          child: selectScholarity(
                            state.scholarityResponsable,
                            controller.setScholarityResponsable,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: inputJob(state.jobResponsable,
                              controller.setJobResponsable),
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
                            child: inputName(
                          state.nameFiliation1,
                          controller.setNameFiliation1,
                        )),
                        Flexible(
                            child: inputCPF(
                          state.cpfFiliation1,
                          controller.setCpfFiliation1,
                        )),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                            child: inputRG(
                          state.rgFiliation1,
                          controller.setRgFiliation1,
                        )),
                        Flexible(
                          child: selectScholarity(
                            state.scholarityFiliation1,
                            controller.setScholarityFiliation1,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: inputJob(
                              state.jobFiliation1, controller.setJobFiliation1),
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
                            child: inputName(
                          state.nameFiliation2,
                          controller.setNameFiliation2,
                        )),
                        Flexible(
                            child: inputCPF(
                          state.cpfFiliation2,
                          controller.setCpfFiliation2,
                        )),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                            child: inputRG(
                          state.rgFiliation2,
                          controller.setRgFiliation2,
                        )),
                        Flexible(
                          child: selectScholarity(
                            state.scholarityFiliation2,
                            controller.setScholarityFiliation2,
                          ),
                        ),
                      ],
                    ),
                    RowToColumn(
                      children: [
                        Flexible(
                          child: inputJob(
                              state.jobFiliation2, controller.setJobFiliation2),
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
