// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tag_ui/src/components/shared/field_constraints.dart';
import 'package:tag_ui/tag_ui.dart';

class TagDropdownFieldMultiSelect<T> extends StatelessWidget {
  final Map<T, String> items;
  final String label;
  final FormFieldSetter<T> onChanged;
   final EdgeInsets padding;

  const TagDropdownFieldMultiSelect({
    Key? key,
    required this.items,
    required this.label,
    required this.onChanged,
    this.padding = TagSpancing.paddingTextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final mappedItems = items.entries.map((item) => MultiSelectItem<T>(item.key, item.value)).toList();
      


    // [
    //   for (var item in items.entries)
    //     MultiSelectItem<T>(
    //       label: Text(item.value),
    //       value: item.key,
    //     ),
    // ];

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
              items: mappedItems,
              listType: MultiSelectListType.CHIP,
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
