import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolContactDataForm extends StatefulWidget {
  const SchoolContactDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolContactDataForm> createState() => _SchoolContactDataFormState();
}

class _SchoolContactDataFormState extends State<SchoolContactDataForm> {
  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Contato",
      type: HeadingType.Title2,
    );
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputPrimaryPhone(String primaryPhone) => TagTextField(
          label: "Telefone primário",
          hint: "Digite o telefone primário",
          value: primaryPhone,
          validator: MultiValidator([
            requiredValidator,
            phoneValidator,
          ]),
        );
    Widget inputSecondaryPhone(String secondaryPhone) => TagTextField(
          label: "Telefone secundário",
          hint: "Digite o telefone secundário",
          value: secondaryPhone,
          validator: phoneValidator,
        );
    Widget inputEmail(String primaryPhone) => TagTextField(
          label: "E-mail da escola",
          hint: "Digite o e-mail da escola",
          value: primaryPhone,
          validator: MultiValidator([
            requiredValidator,
            emailValidator,
          ]),
        );
    Widget inputSite(String primaryPhone) => TagTextField(
          label: "Site ou blog da escola",
          hint: "Digite o site ou blog da escola",
          value: primaryPhone,
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        withPadding(heading),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputPrimaryPhone("PlaceHolder")),
          ),
          Flexible(
            child: withPadding(inputSecondaryPhone("PlaceHolder")),
          ),
        ]),
        RowToColumn(children: [
          Flexible(
            child: withPadding(inputEmail("PlaceHolder")),
          ),
          Flexible(
            child: withPadding(inputSite("PlaceHolder")),
          ),
        ]),
      ],
    );
  }
}
