import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    super.key,
    required this.onChanged,
    required this.label,
    this.value = false,
  });
  final void Function(bool?)? onChanged;
  final bool value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: TagLabel(
            label,
          ),
        ),
      ],
    );
  }
}
