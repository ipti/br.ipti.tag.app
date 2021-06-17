import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/label/tag_label.dart';
import 'package:orbit_ui_tag/components/shared/field_constraints.dart';
import 'package:orbit_ui_tag/components/shared/masks.dart';
import 'package:orbit_ui_tag/components/shared/tag_input_decoration.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

class TagDatePickerField extends StatefulWidget {
  TagDatePickerField({
    Key key,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText,
    this.maxLength,
    this.formatters,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    @required this.label,
    this.value,
  }) : super(key: key);

  final String hint;
  final String label;
  final String value;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLength;
  final List<TextInputFormatter> formatters;
  final Function validator;
  final Function onChanged;
  final Function onEditingComplete;

  @override
  _TagDatePickerFieldState createState() => _TagDatePickerFieldState();
}

class _TagDatePickerFieldState extends State<TagDatePickerField> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: TagFontSize.fontSizeInputNormal,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: TagLabel(widget.label),
        ),
        Container(
          constraints: fieldBoxConstraints,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: widget?.value ?? "",
            controller: widget.controller,
            inputFormatters: [
              ...(widget.formatters ?? []),
              TagMasks.maskDate,
            ],
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            style: textStyle,
            validator: widget.validator,
            decoration: buildInputDecoration(widget.hint),
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onEditingComplete,
          ),
        ),
      ],
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      widget.controller.text = picked.toString();
  }
}
