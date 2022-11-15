import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/util/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../bloc/instructor_states.dart';
import 'bloc/instructor_personal_bloc.dart';
import 'bloc/instructor_personal_states.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({
    super.key,
    this.instructor,
    this.editMode = EditMode.Create,
  });

  final EditMode editMode;
  final InstructorFormState? instructor;

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<InstructorPersonalBloc>();

  @override
  void initState() {
    if (widget.editMode == EditMode.Edit) {
      controller.loadInstructor(widget.instructor!);
      controller.autoUpdate();
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.editMode == EditMode.Edit) {
      controller.loadInstructor(widget.instructor!);
      controller.autoUpdate();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const heading1 = Heading(
      text: "Dados básicos",
      type: HeadingType.Title3,
    );

    const heading2 = Heading(
      text: "Saúde e recursos",
      type: HeadingType.Title3,
    );
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return Form(
      key: _formKey,
      child: BlocBuilder<InstructorPersonalBloc, InstructorPersonalState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 16),
                    child: heading1,
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: _NameField(
                          name: state.name,
                          controller: controller,
                        ),
                      ),
                      Flexible(
                        child: _BirthdayField(
                          birthday: state.birthdayDate,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(
                    children: [
                      Flexible(
                        child: _CPFField(
                          cpf: state.cpf,
                          controller: controller,
                        ),
                      ),
                      Flexible(
                        child: _EmailField(
                          email: state.email,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  RowToColumn(children: [
                    Flexible(
                      child: _ColorRaceField(
                        colorRace: state.colorRace,
                        controller: controller,
                      ),
                    ),
                    Flexible(
                      child: _SexField(
                        sex: state.sex,
                        controller: controller,
                      ),
                    ),
                  ]),
                  RowToColumn(children: [
                    Flexible(
                      child: _NationalityField(
                        nationality: state.nationality,
                        controller: controller,
                      ),
                    ),
                    Flexible(
                      child: _FiliationField(
                        filiation: 1,
                        controller: controller,
                      ),
                    ),
                  ]),
                  RowToColumn(children: [
                    Flexible(
                      child: _ScholarityField(
                        controller: controller,
                        scholarity: state.scholarity,
                      ),
                    ),
                    const Spacer(),
                  ]),
                  const Padding(
                    padding: EdgeInsets.only(top: 36, bottom: 16),
                    child: heading2,
                  ),
                  RowToColumn(children: [
                    Flexible(
                      child: _FormDeficiency(
                        controller: controller,
                        state: state,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: RowToColumn(
                      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          fit: isDesktop ? FlexFit.loose : FlexFit.tight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            child: TagButton(
                              backgroundColor: TagColors.colorBaseCloudNormal,
                              textButtonColor: TagColors.colorBaseInkNormal,
                              text: "Salvar dados e Avançar",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.submitPersonalForm();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SexField extends StatelessWidget {
  const _SexField({
    required this.controller,
    this.sex,
  });
  final int? sex;
  final InstructorPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('INSTRUCTOR_PERSONAL_SEX'),
      label: 'Sexo',
      hint: "Selecione o sexo",
      items: controller.sexItems,
      onChanged: controller.setSex,
      value: sex,
      validator: requiredDropdownValidator<int?>(),
    );
  }
}

class _ColorRaceField extends StatelessWidget {
  const _ColorRaceField({
    required this.controller,
    this.colorRace,
  });

  final InstructorPersonalBloc controller;
  final int? colorRace;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('INSTRUCTOR_PERSONAL_COLOR_RACE'),
      label: 'Cor/Raça',
      hint: "Selecione a cor/raça",
      items: controller.colorRaceItems,
      onChanged: controller.setColorRace,
      value: colorRace,
      validator: requiredDropdownValidator<int?>(),
    );
  }
}

class _FiliationField extends StatelessWidget {
  const _FiliationField({
    required this.controller,
    this.filiation,
  });

  final int? filiation;
  final InstructorPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('INSTRUCTOR_PERSONAL_FILIATION'),
      label: 'Filiação',
      hint: "Selecione a filiação",
      items: controller.filiationItems,
      onChanged: controller.setFiliation,
      value: filiation,
      validator: requiredDropdownValidator<int?>(),
    );
  }
}

class _NationalityField extends StatelessWidget {
  const _NationalityField({
    required this.controller,
    this.nationality,
  });
  final int? nationality;
  final InstructorPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('INSTRUCTOR_PERSONAL_NATIONALITY'),
      label: 'Nacionalidade',
      hint: "Selecione a nacionalidade",
      items: controller.nationalityItems,
      onChanged: controller.setNationality,
      value: nationality,
      validator: requiredDropdownValidator<int?>(),
    );
  }
}

class _BirthdayField extends StatelessWidget {
  const _BirthdayField({
    this.birthday,
    required this.controller,
  });

  final String? birthday;
  final InstructorPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDatePickerField(
      key: const Key('INSTRUCTOR_PERSONAL_BIRTHDAY'),
      label: "Data  de nascimento",
      hint: "__/__/____",
      onChanged: controller.setBirthday,
      value: birthday,
      inputType: TextInputType.number,
      validator: MultiValidator([
        requiredValidator,
        dateValidator,
      ]),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    this.name,
    required this.controller,
  });

  final InstructorPersonalBloc controller;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('INSTRUCTOR_PERSONAL_NAME'),
      label: "Nome",
      hint: "Digite o nome do professor",
      onChanged: controller.setName,
      value: name,
      inputType: TextInputType.name,
      validator: MultiValidator([
        requiredValidator,
        minLengthValidator(10),
        onlyLettersValidator,
      ]),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    this.email,
    required this.controller,
  });

  final InstructorPersonalBloc controller;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('INSTRUCTOR_PERSONAL_EMAIL'),
      label: "Email",
      hint: "Digite o email do professor",
      onChanged: controller.setEmail,
      value: email,
      inputType: TextInputType.emailAddress,
      validator: MultiValidator([
        requiredValidator,
        emailValidator,
      ]),
    );
  }
}

class _CPFField extends StatelessWidget {
  const _CPFField({
    this.cpf,
    required this.controller,
  });

  final InstructorPersonalBloc controller;
  final String? cpf;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('INSTRUCTOR_PERSONAL_CPF'),
      label: "CPF",
      hint: "Somente números",
      onChanged: controller.setCPF,
      value: cpf,
      formatters: [TagMasks.maskCPF],
      inputType: TextInputType.number,
      validator: MultiValidator([
        requiredValidator,
        cpfValidator,
      ]),
    );
  }
}

class _ScholarityField extends StatelessWidget {
  const _ScholarityField({
    this.scholarity,
    required this.controller,
  });

  final int? scholarity;
  final InstructorPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField(
      key: const Key('INSTRUCTOR_PERSONAL_SCHOLARITY'),
      label: 'Escolaridade',
      items: controller.scholarityItems,
      value: scholarity,
      onChanged: controller.setScholarity,
    );
  }
}

class _FormDeficiency extends StatelessWidget {
  const _FormDeficiency({
    required this.controller,
    required this.state,
  });

  final InstructorPersonalBloc controller;
  final InstructorPersonalState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagCheckbox(
          label: "Deficiência",
          value: state.deficiency,
          onChanged: controller.setDeficiency,
        ),
        const Divider(
          color: TagColors.colorBaseProductNormal,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Cegueira",
          value: state.deficiencyTypeBlindness,
          onChanged: controller.setDeficiencyTypeBlindness,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Baixa visão",
          value: state.deficiencyTypeLowVision,
          onChanged: controller.setDeficiencyTypeLowVision,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Surdez",
          value: state.deficiencyTypeDeafness,
          onChanged: controller.setDeficiencyTypeDeafness,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência auditiva",
          value: state.deficiencyTypeDisabilityHearing,
          onChanged: controller.setDeficiencyTypeDisabilityHearing,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Surdocegueira",
          value: state.deficiencyTypeDeafblindness,
          onChanged: controller.setDeficiencyTypeDeafblindness,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Física",
          value: state.deficiencyTypePhisicalDisability,
          onChanged: controller.setDeficiencyTypePhisicalDisability,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Intelectual",
          value: state.deficiencyTypeIntelectualDisability,
          onChanged: controller.setDeficiencyTypeIntelectualDisability,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Múltipla",
          value: state.deficiencyTypeMultipleDisabilities,
          onChanged: controller.setDeficiencyTypeMultipleDisabilities,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Transtorno do Espectro Autista",
          value: state.deficiencyTypeAutism,
          onChanged: controller.setDeficiencyTypeAutism,
        ),
        TagCheckbox(
          disabled: !state.deficiency,
          label: "Altas Habilidades / Super Dotação",
          value: state.deficiencyTypeGifted,
          onChanged: controller.setDeficiencyTypeGifted,
        ),
      ],
    );
  }
}
