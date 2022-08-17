import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolAdminDataForm extends StatefulWidget {
  const SchoolAdminDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolAdminDataForm> createState() => _SchoolAdminDataFormState();
}

class _SchoolAdminDataFormState extends State<SchoolAdminDataForm> {
  @override
  Widget build(BuildContext context) {
    const heading = Heading(text: "Dados do gestor", type: HeadingType.Title2);
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputSchoolName(String schoolName) => TagTextField(
          label: "Nome da escola",
          hint: "Digite o nome da escola",
          value: schoolName,
          validator: requiredValidator,
        );
    Widget inputInepCode(String inepCode) => TagTextField(
          label: "Código do INEP",
          hint: "Digite o código do INEP",
          value: inepCode,
          validator: requiredValidator,
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
          hint: "Selecione",
          validator: requiredValidator,
          items: {},
        );
    Widget inputStartDate(String inepCode) => TagTextField(
          label: "Data de início da escola",
          hint: "Somente números",
          value: inepCode,
          validator: requiredValidator,
        );

    Widget inputRecognitionAct(String inepCode) => TagTextField(
          label: "Ato de reconhecimento",
          hint: "Digite o código do INEP",
          value: inepCode,
          validator: requiredValidator,
        );
    Widget inputEndDate(String schoolName) => TagTextField(
          label: "Data do fechamento da escola",
          hint: "Digite o nome da escola",
          value: schoolName,
          validator: requiredValidator,
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        withPadding(heading),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputSchoolName("PlaceHolder")),
          ),
          Flexible(
            child: withPadding(inputInepCode("PlaceHolder")),
          ),
        ]),
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
            child: withPadding(inputStartDate("PlaceHolder")),
          ),
        ]),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputRecognitionAct("PlaceHolder")),
          ),
          Flexible(
            child: withPadding(inputEndDate("PlaceHolder")),
          ),
        ]),
      ],
    );
  }
}
