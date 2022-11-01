import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/util/validators/validators.dart';
import 'package:br_ipti_tag_app/app/core/widgets/submit_buttons_row/submit_buttons_row.dart';

import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({
    super.key,
    this.student,
    this.editMode = EditMode.Create,
  });

  final Student? student;
  final EditMode editMode;

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnrollmentPersonalBloc>();

  @override
  void initState() {
    if (widget.student != null) controller.loadStudent(widget.student!);
    super.initState();
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

    return Form(
      key: _formKey,
      child: BlocBuilder<EnrollmentPersonalBloc, EnrollmentPersonalState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  heading1,
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
                          birthday: state.birthday,
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
                        filiation: state.filiation,
                        controller: controller,
                      ),
                    ),
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
                    Flexible(
                      child: _FoodRestrictionField(
                        foodRestriction: state.foodRestrictions,
                        controller: controller,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: SubmitButtonsRow(
                      onSubmitAndGo: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitPersonalForm(widget.editMode);
                        }
                      },
                      onSubmitAndStay: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitPersonalForm(widget.editMode);
                        }
                      },
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
  final EnrollmentPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_SEX'),
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

  final EnrollmentPersonalBloc controller;
  final int? colorRace;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_COLOR_RACE'),
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
  final EnrollmentPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_FILIATION'),
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
  final EnrollmentPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDropdownField<int>(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_NATIONALITY'),
      label: 'Nacionalidade',
      hint: "Selecione a nacionalidade",
      items: controller.nationalityItems,
      onChanged: controller.setNationality,
      value: nationality,
      validator: requiredDropdownValidator<int?>(),
    );
  }
}

class _FoodRestrictionField extends StatelessWidget {
  const _FoodRestrictionField({
    required this.controller,
    this.foodRestriction,
  });
  final String? foodRestriction;
  final EnrollmentPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_FOOD_RESTRICTION'),
      label: "Restrição Alimentar / Alergia",
      inputType: TextInputType.multiline,
      hint: "",
      onChanged: controller.setFoodRestriction,
      value: foodRestriction,
      maxLines: 5,
    );
  }
}

class _BirthdayField extends StatelessWidget {
  const _BirthdayField({
    this.birthday,
    required this.controller,
  });

  final String? birthday;
  final EnrollmentPersonalBloc controller;

  @override
  Widget build(BuildContext context) {
    return TagDatePickerField(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_BIRTHDAY'),
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

  final EnrollmentPersonalBloc controller;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return TagTextField(
      key: const Key('STUDENT_ENROLLMENT_PERSONAL_NAME'),
      label: "Nome",
      hint: "Digite o nome do aluno",
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

class _FormDeficiency extends StatelessWidget {
  const _FormDeficiency({
    required this.controller,
    required this.state,
  });

  final EnrollmentPersonalBloc controller;
  final EnrollmentPersonalState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TagCheckbox(
          label: "Deficiência",
          value: state.deficiency,
          onChange: controller.setDeficiency,
        ),
        const Divider(
          color: TagColors.colorBaseProductNormal,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Cegueira",
          value: state.deficiencyTypeBlindness,
          onChange: controller.setDeficiencyTypeBlindness,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Baixa visão",
          value: state.deficiencyTypeLowVision,
          onChange: controller.setDeficiencyTypeLowVision,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Surdez",
          value: state.deficiencyTypeDeafness,
          onChange: controller.setDeficiencyTypeDeafness,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência auditiva",
          value: state.deficiencyTypeDisabilityHearing,
          onChange: controller.setDeficiencyTypeDisabilityHearing,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Surdocegueira",
          value: state.deficiencyTypeDeafblindness,
          onChange: controller.setDeficiencyTypeDeafblindness,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Física",
          value: state.deficiencyTypePhisicalDisability,
          onChange: controller.setDeficiencyTypePhisicalDisability,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Intelectual",
          value: state.deficiencyTypeIntelectualDisability,
          onChange: controller.setDeficiencyTypeIntelectualDisability,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Deficiência Múltipla",
          value: state.deficiencyTypeMultipleDisabilities,
          onChange: controller.setDeficiencyTypeMultipleDisabilities,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Transtorno do Espectro Autista",
          value: state.deficiencyTypeAutism,
          onChange: controller.setDeficiencyTypeAutism,
        ),
        _TagCheckbox(
          disabled: !state.deficiency,
          label: "Altas Habilidades / Super Dotação",
          value: state.deficiencyTypeGifted,
          onChange: controller.setDeficiencyTypeGifted,
        ),
      ],
    );
  }
}

class _TagCheckbox extends StatelessWidget {
  const _TagCheckbox({
    required this.onChange,
    this.value = false,
    this.disabled = false,
    required this.label,
  });

  final void Function(bool?) onChange;
  final bool? value;
  final bool disabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value ?? false,
          onChanged: disabled ? null : onChange,
        ),
        TagLabel(label),
      ],
    );
  }
}
