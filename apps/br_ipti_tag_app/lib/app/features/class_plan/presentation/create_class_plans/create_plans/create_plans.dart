import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../class_plan_cubit.dart';

class CreatePlans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      const TagTextField(label: 'Name'),
                  TagDropdownField<Etapas>(
                    onChanged: (e) => {},
                    label: "Etapas",
                    items: Map.fromEntries(
                      etapas!.map(
                        (e) => MapEntry(e, e.name),
                      ),
                    ),
                  ),
                  TagDropdownField<Etapas>(
                    onChanged: (e) => {},
                    label: "Diciplinas",
                    items: Map.fromEntries(
                      etapas!.map(
                        (e) => MapEntry(e, e.name),
                      ),
                    ),
                  ),
    ],)
  }

}