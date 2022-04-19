import 'package:flutter/material.dart';
import 'package:tag_ui/components/components.dart';

class SchoolBodiesAffiliatedDataForm extends StatefulWidget {
  const SchoolBodiesAffiliatedDataForm({Key? key}) : super(key: key);

  @override
  State<SchoolBodiesAffiliatedDataForm> createState() =>
      _SchoolBodiesAffiliatedDataFormState();
}

class _SchoolBodiesAffiliatedDataFormState
    extends State<SchoolBodiesAffiliatedDataForm> {
  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Órgãos que a escola está vinculada",
      type: HeadingType.Title2,
    );
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        withPadding(heading),
      ],
    );
  }
}
