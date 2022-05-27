import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolOthersDataForm extends StatefulWidget {
  const SchoolOthersDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolOthersDataForm> createState() => _SchoolOthersDataFormState();
}

class _SchoolOthersDataFormState extends State<SchoolOthersDataForm> {
  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Outras informações",
      type: HeadingType.Title2,
    );
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputSchoolName(String schoolName) => TagDropdownField(
          label: "Organização da Sociedade Civil (OSCIP)",
          hint: "Selecione o Organização da Sociedade Civil (OSCIP)",
          validator: requiredValidator,
          items: {},
          onChanged: () => {},
        );
    Widget inputInepCode(String inepCode) => TagTextField(
          label: "Código do INEP",
          hint: "Digite o código do INEP",
          value: inepCode,
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
      ],
    );
  }
}
