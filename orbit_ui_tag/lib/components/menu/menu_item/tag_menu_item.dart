import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuItem extends StatelessWidget implements ITagMenuItem {
  const TagMenuItem({
    Key key,
    @required this.title,
    @required this.route,
    @required this.onTap,
    this.icon,
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final String route;
  final Widget icon;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = isActive
        ? TagColors.colorTextLinkPrimaryHover
        : TagColors.colorTextLinkPrimary;

    final textStyle = TextStyle(
      color: textColor,
      fontWeight: TagFontWeight.fontWeightLinks,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
    );

    return Opacity(
      opacity: isActive ? 1 : 0.64,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: textStyle,
        ),
        onTap: () {
          onTap.call(route);
        },
      ),
    );
  }

  copyWith({
    String title,
    Function onTap,
    bool isActive,
  }) {
    return TagMenuItem(
      title: title ?? this.title,
      route: route ?? this.route,
      onTap: onTap ?? this.onTap,
      isActive: isActive ?? this.isActive,
    );
  }
}
