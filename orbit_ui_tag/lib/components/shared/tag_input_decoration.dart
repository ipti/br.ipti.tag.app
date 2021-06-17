import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

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

final textStyle = TextStyle(
  fontSize: TagFontSize.fontSizeInputNormal,
  color: TagColors.colorTextInput,
);

final buildInputDecoration = (String hint) => InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: hint,
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
