import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

const borderSide = BorderSide(
  color: TagBorderColor.borderColorInput,
  width: TagBorderStyle.borderWidthInput,
  style: BorderStyle.solid,
);

final border = OutlineInputBorder(
  borderSide: borderSide,
  borderRadius: BorderRadius.circular(
    TagBorderRadiusValues.borderRadiusLarge,
  ),
);

const textStyle = TextStyle(
  fontSize: TagFontSize.fontSizeInputNormal,
  color: TagColors.colorTextInput,
);

final buildInputDecoration = (String hint) => InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: hint,
      filled: true,
      fillColor: TagBackgroundColors.backgroundInput,
      contentPadding: TagSpancing.paddingInputNormal,
      enabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(
          color: TagBorderColor.borderColorInput,
        ),
      ),
      border: border,
    );
