import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/components/components.dart';

class SchoolAdressDataForm extends StatefulWidget {
  const SchoolAdressDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolAdressDataForm> createState() => _SchoolAdressDataFormState();
}

class _SchoolAdressDataFormState extends State<SchoolAdressDataForm> {
  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Endereço",
      type: HeadingType.Title2,
    );
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputCep(String cep) => TagTextField(
          label: "CEP",
          hint: "Digite o CEP da escola",
          value: cep,
          validator: requiredValidator,
        );
    Widget inputStreet(String cep) => TagTextField(
          label: "Rua",
          hint: "Digite o CEP da escola",
          value: cep,
          validator: requiredValidator,
        );
    Widget inputCepa(String schoolName) => TagDropdownField(
          label: "CEP",
          hint: "Digite o CEP da escola",
          validator: requiredValidator,
          items: {},
          onChanged: () => {},
        );
    return Column(
      children: <Widget>[
        withPadding(heading),
        RowToColumn(
          children: [
            Flexible(
              child: withPadding(inputCep("PlaceHolder")),
            ),
            Flexible(
              child: withPadding(inputStreet("PlaceHolder")),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              child: withPadding(inputCep("PlaceHolder")),
            ),
            Flexible(
              child: withPadding(inputStreet("PlaceHolder")),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              child: withPadding(inputCep("PlaceHolder")),
            ),
            Flexible(
              child: withPadding(inputStreet("PlaceHolder")),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              child: withPadding(inputCep("PlaceHolder")),
            ),
            Flexible(
              child: withPadding(inputStreet("PlaceHolder")),
            ),
          ],
        ),
        RowToColumn(
          children: [
            Flexible(
              child: withPadding(inputCep("PlaceHolder")),
            ),
            Flexible(
              child: withPadding(inputStreet("PlaceHolder")),
            ),
          ],
        ),
      ],
    );
  }
}
