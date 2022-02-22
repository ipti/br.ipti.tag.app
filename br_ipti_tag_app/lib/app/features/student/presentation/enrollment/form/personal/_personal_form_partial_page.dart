import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/personal/bloc/enrollment_personal_states.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/widgets/submit_buttons_row.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({Key? key}) : super(key: key);

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnrollmentPersonalBloc>();

  @override
  Widget build(BuildContext context) {
    Widget inputName(String? name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    Widget inputBirthday(String? birthday) => TagDatePickerField(
          label: "Data  de nascimento",
          hint: "__/__/____",
          onChanged: controller.setBirthday,
          value: birthday,
          validator: requiredValidator,
          inputType: TextInputType.number,
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

    Widget deficiencyCheck({bool? deficiency}) => Row(
          children: [
            Checkbox(
              value: deficiency ?? false,
              onChanged: (value) => controller.setDeficiency(value: value!),
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

    const heading = Heading(text: "Dados do Aluno", type: HeadingType.Title3);

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
                    heading,
                    RowToColumn(
                      children: [
                        Flexible(child: inputName(state.name)),
                        Flexible(child: inputBirthday(state.birthday)),
                      ],
                    ),
                    RowToColumn(children: [
                      Flexible(child: selectSex(state.sex)),
                      Flexible(child: selectColorRace(state.colorRace)),
                      Flexible(
                        flex: 3,
                        child: selectNationality(state.nationality),
                      ),
                    ]),
                    RowToColumn(children: [
                      Flexible(child: selectFiliation(state.filiation)),
                      Flexible(
                        child: inputFoodRestriction(state.foodRestrictions),
                      ),
                    ]),
                    deficiencyCheck(deficiency: state.deficiency),
                    SubmitButtonsRow(
                      onSubmitAndGo: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitPersonalForm();
                        }
                      },
                      onSubmitAndStay: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitPersonalForm();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
