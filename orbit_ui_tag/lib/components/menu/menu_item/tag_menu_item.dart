import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuItem extends StatelessWidget implements ITagMenuItem {
  const TagMenuItem(
      {Key key, @required this.title, @required this.onTap, this.icon})
      : super(key: key);

  final String title;
  final Widget icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: TagColors.colorTextButtonPrimary,
      fontWeight: TagFontWeight.fontWeightLinks,
    );

    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: textStyle,
      ),
      onTap: onTap,
    );
  }
}
