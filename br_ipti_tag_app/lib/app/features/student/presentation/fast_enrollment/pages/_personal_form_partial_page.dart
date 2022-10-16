import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/bloc/fast_enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/bloc/fast_enrollment_states.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({super.key});

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<FastEnrollmentBloc>();
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    Widget inputName(String? name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    Widget inputBirthday(String? birthday) => TagDatePickerField(
          label: "Data nascimento",
          hint: "__/__/____",
          onChanged: controller.setBirthday,
          value: birthday,
          validator: requiredValidator,
        );

    Widget selectSex(int? sex) => TagDropdownField<int>(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: controller.sexItems,
          onChanged: controller.setSex,
          value: sex,
          validator: requiredDropdownValidator<int?>(),
        );

    Widget selectColorRace(int? colorRace) => TagDropdownField<int>(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: controller.colorRaceItems,
          onChanged: controller.setColorRace,
          value: colorRace,
          validator: requiredDropdownValidator<int?>(),
        );

    Widget selectFiliation(int? filiation) => TagDropdownField<int>(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: controller.filiationItems,
          onChanged: controller.setFiliation,
          value: filiation,
          validator: requiredDropdownValidator<int?>(),
        );

    Widget selectNationality(int? nationality) => TagDropdownField<int>(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: controller.nationalityItems,
          onChanged: controller.setNationality,
          value: nationality,
          validator: requiredDropdownValidator<int?>(),
        );

    Widget deficiencyCheck({bool? deficiency}) => Row(
          children: [
            Checkbox(
              value: deficiency ?? false,
              onChanged: (value) => controller.setDeficiency(value: value),
            ),
            const TagLabel("Deficiência"),
          ],
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

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    const heading = Heading(text: "Dados do Aluno", type: HeadingType.Title2);

    final buttonSubmitAndGo = TagButton(
      text: "Salvar e prosseguir",
      onPressed: () => _formKey.currentState!.validate(),
    );

    final buttonSubmitAndStay = TagLinkButton(
      text: "Salvar e continuar na página",
      onPressed: () => _formKey.currentState!.validate(),
    );

    return Form(
      key: _formKey,
      child: BlocBuilder<FastEnrollmentBloc, FastEnrollmentState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  heading,
                  RowToColumn(
                    children: [
                      Flexible(
                        child: inputName(state.name),
                      ),
                      Flexible(
                        child: inputBirthday(state.birthday),
                      ),
                    ],
                  ),
                  RowToColumn(children: [
                    Flexible(
                      child: selectSex(state.sex),
                    ),
                    Flexible(
                      child: selectColorRace(state.colorRace),
                    ),
                    Flexible(
                      flex: 3,
                      child: selectNationality(state.nationality),
                    ),
                  ]),
                  RowToColumn(children: [
                    Flexible(
                      child: selectFiliation(state.filiation),
                    ),
                    Flexible(
                      child: inputFoodRestriction(state.foodRestrictions),
                    ),
                  ]),
                  deficiencyCheck(deficiency: state.deficiency),
                  RowToColumn(
                    children: [
                      const Spacer(),
                      Flexible(child: buttonSubmitAndStay),
                      Flexible(child: buttonSubmitAndGo),
                    ],
                  ),
                ]
                    .map(
                      (w) => withPadding(w),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
