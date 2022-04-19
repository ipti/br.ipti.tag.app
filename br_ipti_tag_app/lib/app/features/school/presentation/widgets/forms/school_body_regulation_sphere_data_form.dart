import 'package:flutter/material.dart';
import 'package:tag_ui/components/components.dart';

class SchoolBodyRegulationSphereDataForm extends StatefulWidget {
  const SchoolBodyRegulationSphereDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolBodyRegulationSphereDataForm> createState() =>
      _SchoolBodyRegulationSphereDataFormState();
}

class _SchoolBodyRegulationSphereDataFormState
    extends State<SchoolBodyRegulationSphereDataForm> {
  bool isFederal = false;
  bool isState = false;
  bool isMunicipal = false;
  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Esfera do Órgão regulador",
      type: HeadingType.Title2,
    );
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget checkboxFederal = TagCheckbox(
      text: 'Órgão Federal',
      isChecked: isFederal,
      onChanged: (p0) {
        setState(() {
          isFederal = !isFederal;
        });
      },
    );
    Widget checkboxState = TagCheckbox(
      text: 'Órgão Estadual',
      isChecked: isState,
      onChanged: (p0) {
        setState(() {
          isState = p0!;
        });
      },
    );
    Widget checkboxMunicipal = TagCheckbox(
      text: 'Órgão Municipal',
      isChecked: isMunicipal,
      onChanged: (p0) {
        setState(() {
          isMunicipal = p0!;
        });
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        withPadding(heading),
        checkboxFederal,
        checkboxState,
        checkboxMunicipal,
      ],
    );
  }
}
