import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_state.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolBasicDataForm extends StatefulWidget {
  const SchoolBasicDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolBasicDataForm> createState() => _SchoolBasicDataFormState();
}

class _SchoolBasicDataFormState extends State<SchoolBasicDataForm> {
  final controller = Modular.get<SchoolCubit>();

  @override
  Widget build(BuildContext context) {
    const heading = Heading(text: "Dados básicos", type: HeadingType.Title2);
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputSchoolName(String schoolName) => TagTextField(
          key: const Key("SCHOOL_NAME"),
          label: "Nome da escola",
          hint: "Digite o nome da escola",
          inputType: TextInputType.name,
          validator: requiredValidator,
          value: schoolName,
          onChanged: controller.setCurrentSchoolName,
        );
    Widget inputInepCode(String inepCode) => TagTextField(
          key: const Key("SCHOOL_INEP_ID"),
          label: "Código do INEP",
          hint: "Digite o código do INEP",
          value: inepCode,
          validator: requiredValidator,
          onChanged: controller.setCurrentSchoolInepId,
        );
    Widget inputAdminDep() => TagDropdownField(
          onChanged: () => {},
          label: "Dependência administrativa",
          validator: requiredValidator,
          items: {},
        );
    Widget inputStatus() => TagDropdownField(
          onChanged: () => {},
          label: "Situação",
          validator: requiredValidator,
          items: {},
        );
    Widget inputRegionalAdmin() => TagDropdownField(
          onChanged: () => {},
          label: "Órgão regional de administração",
          hint: "Selecione o órgão regional de administração",
          validator: requiredValidator,
          items: {},
        );
    Widget inputStartDate(String startDate) => TagTextField(
          label: "Data de início da escola",
          hint: "Digite a data do início da escola",
          value: startDate,
          validator: requiredValidator,
          onChanged: controller.setCurrentSchoolInitialDate,
        );

    Widget inputRecognitionAct(String recognitionAct) => TagTextField(
          label: "Ato de reconhecimento",
          hint: "Digite o ato de reconhecimento",
          value: recognitionAct,
          validator: requiredValidator,
          onChanged: controller.setCurrentSchoolActOfAcknowledgement,
        );
    Widget inputEndDate(String endDate) => TagTextField(
          label: "Data do fechamento da escola",
          hint: "Digite a data do fechamento da escola",
          value: endDate,
          validator: requiredValidator,
          onChanged: controller.setCurrentSchoolFinalDate,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        withPadding(heading),
        BlocBuilder<SchoolCubit, SchoolState>(
          bloc: controller,
          builder: (context, state) {
            return RowToColumn(children: [
              Flexible(
                child: withPadding(inputSchoolName(
                    controller.state.currentSchoolData?.name ?? "")),
              ),
              Flexible(
                child: withPadding(inputInepCode(
                    controller.state.currentSchoolData?.inepId ?? "")),
              ),
            ]);
          },
        ),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputAdminDep()),
          ),
          Flexible(
            child: withPadding(inputStatus()),
          ),
        ]),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputRegionalAdmin()),
          ),
          Flexible(
            child: withPadding(inputStartDate(
                controller.state.currentSchoolData?.initialDate ?? "")),
          ),
        ]),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputRecognitionAct(
                controller.state.currentSchoolData?.actOfAcknowledgement ??
                    "")),
          ),
          Flexible(
            child: withPadding(inputEndDate(
                controller.state.currentSchoolData?.finalDate ?? "")),
          ),
        ]),
      ],
    );
  }
}
