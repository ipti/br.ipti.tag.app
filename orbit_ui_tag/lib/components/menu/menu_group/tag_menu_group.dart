import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/menu/menu_item/tag_menu_item.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuGroup extends StatelessWidget implements ITagMenuItem {
  const TagMenuGroup({
    Key key,
    @required this.title,
    @required this.submenus,
    this.icon,
    this.routeActiveItem = "/",
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final bool isActive;
  final String routeActiveItem;
  final List<TagMenuItem> submenus;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: TagColors.colorTextButtonPrimary,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
    );

    return ExpansionTile(
      initiallyExpanded: isActive,
      iconColor: Colors.transparent,
      collapsedIconColor: Colors.transparent,
      leading: icon,
      title: Opacity(
        opacity: isActive ? 1 : 0.64,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
      children: [
        for (var i = 0; i < submenus.length; i++)
          submenus[i].copyWith(
            isActive: routeActiveItem == submenus[i].route,
          )
      ],
      childrenPadding: EdgeInsets.only(left: 16),
    );
  }

  copyWith({
    String title,
    Widget icon,
    bool isActive,
    String routeActiveItem,
    int menuGroupId,
    List<TagMenuItem> submenus,
  }) {
    return TagMenuGroup(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      submenus: submenus ?? this.submenus,
      isActive: isActive ?? this.isActive,
      routeActiveItem: routeActiveItem ?? this.routeActiveItem,
    );
  }
}
