import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/line_height.dart';
import 'package:orbit_ui_tag/design_tokens/sizes.dart';

final fieldBoxConstraints = BoxConstraints(
  minHeight: TagSizes.heightInputNormal,
  maxHeight: TagSizes.heightInputLarge + TagLineHeight.lineHeightTextNormal,
);
