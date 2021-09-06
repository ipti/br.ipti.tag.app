import 'package:flutter/widgets.dart';
import 'package:tag_ui_design_system/design_tokens/line_height.dart';
import 'package:tag_ui_design_system/design_tokens/sizes.dart';

const fieldBoxConstraints = BoxConstraints(
  minHeight: TagSizes.heightInputNormal,
  maxHeight: TagSizes.heightInputLarge + TagLineHeight.lineHeightTextNormal,
);
