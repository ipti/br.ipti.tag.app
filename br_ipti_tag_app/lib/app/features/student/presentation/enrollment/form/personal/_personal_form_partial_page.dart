import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_states.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_ui/tag_ui.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({
    Key? key,
    this.student,
    this.editMode = EditMode.Create,
  }) : super(key: key);

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
    Widget inputName(String? name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          inputType: TextInputType.name,
          validator: MultiValidator([
            requiredValidator,
            minLengthValidator(10),
            onlyLettersValidator
          ]),
        );

    Widget inputBirthday(String? birthday) => TagDatePickerField(
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

    Widget selectSex(int? sex) => TagDropdownField<int>(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: controller.sexItems,
          onChanged: controller.setSex,
          value: sex,
          validator: requiredValidator,
        );

    Widget selectColorRace(int? colorRace) => TagDropdownField<int>(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: controller.colorRaceItems,
          onChanged: controller.setColorRace,
          value: colorRace,
          validator: requiredValidator,
        );

    Widget selectFiliation(int? filiation) => TagDropdownField<int>(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: controller.filiationItems,
          onChanged: controller.setFiliation,
          value: filiation,
          validator: requiredValidator,
        );

    Widget selectNationality(int? nationality) => TagDropdownField<int>(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: controller.nationalityItems,
          onChanged: controller.setNationality,
          value: nationality,
          validator: requiredValidator,
        );

    Widget inputFoodRestriction(String? foodRestriction) => TagTextField(
          label: "Restrição Alimentar / Alergia",
          inputType: TextInputType.multiline,
          hint: "",
          onChanged: controller.setFoodRestriction,
          value: foodRestriction,
          validator: requiredValidator,
          maxLines: 5,
        );

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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 36, bottom: 16),
                      child: heading1,
                    ),
                    RowToColumn(
                      children: [
                        Flexible(child: inputName(state.name)),
                        Flexible(child: inputBirthday(state.birthday)),
                      ],
                    ),
                    RowToColumn(children: [
                      Flexible(child: selectColorRace(state.colorRace)),
                      Flexible(child: selectSex(state.sex)),
                    ]),
                    RowToColumn(children: [
                      Flexible(
                        child: selectNationality(state.nationality),
                      ),
                      Flexible(child: selectFiliation(state.filiation)),
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
                        child: inputFoodRestriction(state.foodRestrictions),
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
          }),
    );
  }
}

class _FormDeficiency extends StatelessWidget {
  const _FormDeficiency({
    Key? key,
    required this.controller,
    required this.state,
  }) : super(key: key);

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
    Key? key,
    required this.onChange,
    this.value = false,
    this.disabled = false,
    required this.label,
  }) : super(key: key);

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
