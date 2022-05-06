import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_filiation_bloc.dart';
import 'bloc/enrollment_filiation_states.dart';

class FiliationFormPage extends StatefulWidget {
  const FiliationFormPage({Key? key}) : super(key: key);

  @override
  FiliationFormPageState createState() => FiliationFormPageState();
}

class FiliationFormPageState extends State<FiliationFormPage> {
  final controller = Modular.get<EnrollmentFiliationBloc>();
  @override
  Widget build(BuildContext context) {
    const heading = Heading(text: "Responsável", type: HeadingType.Title3);

    Widget inputName(String? name) => TagTextField(
          label: "Nome",
          hint: "Nome completo",
          onChanged: controller.setNameFiliation,
          value: name,
          validator: requiredValidator,
        );

    Widget inputCPF(String? cpf) => TagTextField(
          label: "CPF",
          hint: "digite o CPF",
          onChanged: controller.setNameFiliation,
          formatters: [TagMasks.maskCPF],
          value: cpf,
          validator: requiredValidator,
        );

    Widget inputRG(String? rg) => TagTextField(
          label: "RG",
          hint: "digite o número do RG",
          onChanged: controller.setNameFiliation,
          value: rg,
          validator: requiredValidator,
        );

    Widget selectNationality(int? classId) => TagDropdownField(
          label: 'Nacionalidade',
          items: controller.nationalityItems,
          value: classId,
          onChanged: controller.setNationalityFiliation,
        );

    Widget selectColorRace(int? classId) => TagDropdownField(
          label: 'Cor/Raça',
          items: controller.colorRaceItems,
          value: classId,
          onChanged: controller.setColorRaceFiliation,
        );

    Widget selectScholarity(int? classId) => TagDropdownField(
          label: 'Escolaridade',
          items: controller.scholatiryItems,
          value: classId,
          onChanged: controller.setScholarityFiliation,
        );

    Widget inputJob(String? job) => TagTextField(
          label: "Profissão",
          hint: "Digite a profissão",
          onChanged: controller.setJobFiliation,
          value: job,
          validator: requiredValidator,
        );

    Widget inputEmail(String? email) => TagTextField(
          label: "Email",
          hint: "Digite o email",
          onChanged: controller.setEmailFiliation,
          value: email,
          validator: requiredValidator,
        );

    Widget inputPhone(String? phone) => TagTextField(
          label: "Telefone",
          hint: "Digite o telefone",
          onChanged: controller.setPhoneFiliation,
          value: phone,
          validator: requiredValidator,
        );

    const padding = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    return BlocBuilder<EnrollmentFiliationBloc, EnrollmentFiliationState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  heading,
                  // RowToColumn(
                  //   children: [
                  //     Flexible(child: inputName(state.name)),
                  //     Flexible(child: inputCPF(state.cpf)),
                  //   ],
                  // ),
                  // RowToColumn(
                  //   children: [
                  //     Flexible(child: inputRG(state.rg)),
                  //     Flexible(child: selectNationality(state.nationality))
                  //   ],
                  // ),
                  // RowToColumn(
                  //   children: [
                  //     Flexible(
                  //       child: selectColorRace(state.colorRace),
                  //     ),
                  //     Flexible(
                  //       child: selectScholarity(state.colorRace),
                  //     ),
                  //     Flexible(
                  //       flex: 2,
                  //       child: inputJob(state.job),
                  //     )
                  // ],
                  // ),
                  // RowToColumn(
                  //   children: [
                  //     Flexible(child: inputEmail(state.email)),
                  //     Flexible(child: inputPhone(state.phone))
                  //   ],
                  // ),
                ].map((w) => withPadding(w)).toList(),
              ),
            ),
          );
        });
  }
}
