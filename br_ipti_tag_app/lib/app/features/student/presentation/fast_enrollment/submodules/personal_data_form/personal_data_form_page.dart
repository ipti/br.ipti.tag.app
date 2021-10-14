import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/personal_form_bloc.dart';
import 'bloc/personal_form_states.dart';

class PersonalDataFormPage extends StatefulWidget {
  const PersonalDataFormPage({Key? key}) : super(key: key);

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final controller = Modular.get<PersonalFormBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    Widget inputName(String? name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator as Function?,
        );

    Widget inputBirthday(String? birthday) => TagDatePickerField(
          label: "Data nascimento",
          hint: "__/__/____",
          onChanged: controller.setBirthday,
          value: birthday,
          validator: requiredValidator as Function?,
        );

    Widget selectSex(int? sex) => TagDropdownField(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: controller.sexItems,
          onChanged: controller.setSex,
          value: sex,
          validator: requiredValidator as Function?,
        );

    Widget selectColorRace(int? colorRace) => TagDropdownField(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: controller.colorRaceItems,
          onChanged: controller.setColorRace,
          value: colorRace,
          validator: requiredValidator as Function?,
        );

    Widget selectFiliation(int? filiation) => TagDropdownField(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: controller.filiationItems,
          onChanged: controller.setFiliation,
          value: filiation,
          validator: requiredValidator as Function?,
        );

    Widget selectNationality(int? nationality) => TagDropdownField(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: controller.nationalityItems,
          onChanged: controller.setNationality,
          value: nationality,
          validator: requiredValidator as Function?,
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
          validator: requiredValidator as Function?,
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
      child: BlocBuilder<PersonalFormBloc, PersonalFormState>(
          bloc: controller,
          builder: (context, state) {
            if (state is PersonalFormState) {
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
                            child: selectNationality(state.nationality)),
                      ]),
                      RowToColumn(children: [
                        Flexible(child: selectFiliation(state.filiation)),
                        Flexible(
                            child:
                                inputFoodRestriction(state.foodRestrictions)),
                      ]),
                      deficiencyCheck(deficiency: state.deficiency),
                      RowToColumn(
                        children: [
                          const Spacer(),
                          Flexible(child: buttonSubmitAndStay),
                          Flexible(child: buttonSubmitAndGo),
                        ],
                      ),
                    ].map((w) => withPadding(w)).toList(),
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}