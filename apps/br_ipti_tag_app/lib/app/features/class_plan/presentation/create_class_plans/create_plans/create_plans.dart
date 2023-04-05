import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';


class CreatePlans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const TagTextField(label: 'Name'),
        TagDropdownField(
          onChanged: (e) => {},
          label: "Etapas",
          items: Map.fromEntries(
            ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
              (e) => MapEntry(e, e),
            ),
          ),
        ),
        TagDropdownField(
          onChanged: (e) => {},
          label: "Diciplinas",
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
