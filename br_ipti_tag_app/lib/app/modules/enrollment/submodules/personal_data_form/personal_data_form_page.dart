import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'bloc/personal_form_bloc.dart';
import 'bloc/personal_form_states.dart';

class PersonalDataFormPage extends StatefulWidget {
  PersonalDataFormPage({Key key}) : super(key: key);

  @override
  _PersonalDataFormPageState createState() => _PersonalDataFormPageState();
}

class _PersonalDataFormPageState extends State<PersonalDataFormPage> {
  final controller = Modular.get<PersonalFormBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    final inputName = (name) => TagTextField(
          label: "Nome",
          hint: "Digite o nome do aluno",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    final inputBirthday = (birthday) => TagDatePickerField(
          label: "Data nascimento",
          hint: "__/__/____",
          onChanged: controller.setBirthday,
          value: birthday,
          validator: requiredValidator,
        );

    final selectSex = (sex) => TagDropdownField(
          label: 'Sexo',
          hint: "Selecione o sexo",
          items: controller.sexItems,
          onChanged: controller.setSex,
          value: sex,
          validator: requiredValidator,
        );

    final selectColorRace = (colorRace) => TagDropdownField(
          label: 'Cor/Raça',
          hint: "Selecione a cor/raça",
          items: controller.colorRaceItems,
          onChanged: controller.setColorRace,
          value: colorRace,
          validator: requiredValidator,
        );

    final selectFiliation = (filiation) => TagDropdownField(
          label: 'Filiação',
          hint: "Selecione a filiação",
          items: controller.filiationItems,
          onChanged: controller.setFiliation,
          value: filiation,
          validator: requiredValidator,
        );

    final selectNationality = (nationality) => TagDropdownField(
          label: 'Nacionalidade',
          hint: "Selecione a nacionalidade",
          items: controller.nationalityItems,
          onChanged: controller.setNationality,
          value: nationality,
          validator: requiredValidator,
        );

    final deficiencyCheck = (deficiency) => Row(
          children: [
            Checkbox(
              value: deficiency ?? false,
              onChanged: controller.setDeficiency,
            ),
            const TagLabel("Deficiência"),
          ],
        );

    final inputFoodRestriction = (foodRestriction) => TagTextField(
          label: "Restrição Alimentar / Alergia",
          inputType: TextInputType.multiline,
          hint: "",
          onChanged: controller.setFoodRestriction,
          value: foodRestriction,
          validator: requiredValidator,
          minLines: 1,
          maxLines: 5,
        );

    final withPadding = (widget) => Padding(padding: padding, child: widget);

    const heading =
        const Heading(text: "Dados Pessoais", type: HeadingType.Title2);

    final buttonSubmitAndGo = TagButton(
      text: "Salvar e prosseguir",
      onPressed: () => _formKey.currentState.validate(),
    );

    final buttonSubmitAndStay = TagLinkButton(
      text: "Salvar e continuar na página",
      onPressed: () => _formKey.currentState.validate(),
    );

    return Form(
      key: _formKey,
      child: BlocConsumer<PersonalFormBloc, PersonalFormState>(
          bloc: controller,
          listener: (_, state) => print(state.toString()),
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
                        numColumns: 3,
                        children: [
                          Flexible(child: inputName(state.name)),
                          Flexible(child: inputBirthday(state.birthday)),
                        ],
                      ),
                      RowToColumn(numColumns: 3, children: [
                        Flexible(flex: 1, child: selectSex(state.sex)),
                        Flexible(
                            flex: 1, child: selectColorRace(state.colorRace)),
                        Flexible(
                            flex: 3,
                            child: selectNationality(state.nationality)),
                      ]),
                      RowToColumn(numColumns: 3, children: [
                        Flexible(child: selectFiliation(state.filiation)),
                        Flexible(
                            child:
                                inputFoodRestriction(state.foodRestrictions)),
                      ]),
                      deficiencyCheck(state.deficiency),
                      RowToColumn(
                        numColumns: 2,
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
