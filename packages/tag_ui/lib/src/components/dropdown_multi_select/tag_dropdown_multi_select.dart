
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:tag_ui/src/components/shared/field_constraints.dart';
import 'package:tag_ui/tag_ui.dart';

class TagDropdownFieldMultiSelect<T> extends StatelessWidget {
  final Map<T, String> items;
  final String label;
  final FormFieldSetter<T> onChanged;
  final EdgeInsets padding;
  final String title;

  const TagDropdownFieldMultiSelect({
    Key? key,
    required this.items,
    required this.label,
    required this.onChanged,
    this.title = "Selecione",
    this.padding = TagSpancing.paddingTextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final mappedItems = items.entries.map((item) => MultiSelectItem<T>(item.key, item.value)).toList();


    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TagLabel(label),
          ),
          Container(
            constraints: fieldBoxConstraints,
            child: MultiSelectDialogField(
              dialogHeight: 150,
              title: Text(title),
              buttonText: Text("Selecione"),
              cancelText: Text("Cancelar"),
              items: mappedItems,
              onConfirm: (values) {
               // _selectedAnimals = values;
              },
            ),
          ),
        ],
      ),
    );
  }
}
