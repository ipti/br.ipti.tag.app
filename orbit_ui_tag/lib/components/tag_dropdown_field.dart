import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/backgrounds.dart';
import 'package:orbit_ui_tag/design_tokens/border_color.dart';
import 'package:orbit_ui_tag/design_tokens/border_radius.dart';
import 'package:orbit_ui_tag/design_tokens/border_style.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/font_size.dart';
import 'package:orbit_ui_tag/design_tokens/line_height.dart';
import 'package:orbit_ui_tag/design_tokens/sizes.dart';
import 'package:orbit_ui_tag/design_tokens/spacing.dart';

import 'tag_label.dart';

class TagDropdownField extends StatefulWidget {
  TagDropdownField({
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
    this.items,
    this.value,
  }) : super(key: key);

  final String hint;
  final Map<int, String> items;
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLength;
  final int value;
  final List<TextInputFormatter> formatters;
  final Function validator;
  final Function onChanged;
  final Function onEditingComplete;

  @override
  _TagDropdownFieldState createState() => _TagDropdownFieldState();
}

class _TagDropdownFieldState extends State<TagDropdownField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      color: TagBorderColor.borderColorInput,
      width: TagBorderStyle.borderWidthInput,
    );

    final border = OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.circular(
        TagBorderRadiusValues.borderRadiusLarge,
      ),
    );

    final decoration = InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: widget.hint,
      filled: true,
      fillColor: TagBackgroundColors.backgroundInput,
      contentPadding: TagSpancing.paddingInputNormal,
      focusedBorder: border.copyWith(
        borderSide: borderSide.copyWith(
          color: TagBorderColor.borderColorInputFocus,
        ),
      ),
      border: border,
    );

    final textStyle = TextStyle(
      fontSize: TagFontSize.fontSizeInputNormal,
      color: TagColors.colorTextInput,
    );

    final constraints = BoxConstraints(
      minHeight: TagSizes.heightInputNormal,
      maxHeight: TagSizes.heightInputLarge + TagLineHeight.lineHeightTextNormal,
    );

    final dropdownItens = widget.items
        .map((key, value) {
          return MapEntry(
            key,
            DropdownMenuItem<int>(
              child: Text(value),
              value: key,
            ),
          );
        })
        .values
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagLabel(widget.label),
        Container(
          constraints: constraints,
          child: DropdownButtonFormField(
            value: widget.value,
            items: dropdownItens,
            style: textStyle,
            decoration: decoration,
            validator: (value) => widget.validator != null
                ? widget.validator(value?.toString() ?? "")
                : null,
            onChanged: widget.onChanged,
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          ),
        ),
      ],
    );
  }
}
