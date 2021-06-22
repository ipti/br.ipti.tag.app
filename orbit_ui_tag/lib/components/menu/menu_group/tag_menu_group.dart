import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuGroup extends StatelessWidget implements ITagMenuItem {
  const TagMenuGroup({
    Key key,
    @required this.title,
    @required this.submenus,
    this.icon,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final List<ITagMenuItem> submenus;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: TagColors.colorTextButtonPrimary,
      fontWeight: TagFontWeight.fontWeightLinks,
    );

    return ExpansionTile(
      iconColor: TagColors.colorTextButtonPrimary,
      collapsedIconColor: TagColors.colorTextButtonPrimary,
      leading: icon,
      title: Text(
        title,
        style: textStyle,
      ),
      children: submenus,
      childrenPadding: EdgeInsets.only(left: 16),
    );
  }
}
