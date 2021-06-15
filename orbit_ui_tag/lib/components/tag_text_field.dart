import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/backgrounds.dart';
import 'package:orbit_ui_tag/design_tokens/border_color.dart';
import 'package:orbit_ui_tag/design_tokens/border_radius.dart';
import 'package:orbit_ui_tag/design_tokens/border_style.dart';
import 'package:orbit_ui_tag/design_tokens/font_size.dart';
import 'package:orbit_ui_tag/design_tokens/line_height.dart';
import 'package:orbit_ui_tag/design_tokens/sizes.dart';
import 'package:orbit_ui_tag/design_tokens/spacing.dart';

import 'tag_label.dart';

class TagTextField extends StatefulWidget {
  TagTextField({
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
  _TagTextFieldState createState() => _TagTextFieldState();
}

class _TagTextFieldState extends State<TagTextField> {
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
    );

    final constraints = BoxConstraints(
      minHeight: TagSizes.heightInputNormal,
      maxHeight: TagSizes.heightInputLarge + TagLineHeight.lineHeightTextNormal,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagLabel(widget.label),
        Container(
          constraints: constraints,
          child: TextFormField(
            initialValue: widget?.value ?? "",
            controller: widget.controller,
            inputFormatters: widget.formatters,
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            style: textStyle,
            validator: widget.validator,
            decoration: decoration,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onEditingComplete,
          ),
        ),
      ],
    );
  }
}
