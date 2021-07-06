import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/logo/logo.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

class TagAppBar extends AppBar {
  final IconThemeData iconTheme = IconThemeData(
    color: TagBackgroundColors.backgroundAppbar,
  );
  final double elevation = 0;
  final Color backgroundColor = TagBackgroundColors.backgroundBody;
  final Widget title = Container(
    height: TagSizes.heightServiceLogoMedium,
    child: LogoTag(
      alignment: Alignment.centerLeft,
    ),
  );
}
