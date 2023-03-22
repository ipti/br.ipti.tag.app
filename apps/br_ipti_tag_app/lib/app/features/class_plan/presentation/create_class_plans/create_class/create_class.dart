import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class NewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const styleTitle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Aula',
            style: styleTitle,
          ),
        ),
        const TagTextField(label: "Objetivo"),
        const TagTextField(label: "Tipo"),
        const TagTextField(label: "Conteudo"),
        TagDropdownField(
          onChanged: (e) => {},
          label: 'label',
          items: Map.fromEntries(
            ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
              (e) => MapEntry(e, e),
            ),
          ),
        ),
      ],
    );
  }
}
