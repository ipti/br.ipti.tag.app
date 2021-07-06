import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/menu/menu_controller.dart';
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
    this.indexActiveItem = -1,
    this.isActive = false,
    this.menuGroupId,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final bool isActive;
  final int indexActiveItem;
  final int menuGroupId;
  final List<TagMenuItem> submenus;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: TagColors.colorTextButtonPrimary,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
    );

    return ExpansionTile(
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
            menuGroupId: menuGroupId,
            menuItemId: i,
            isActive: i == menuController.indexMenuItem.value &&
                menuController.indexMenuGroup.value == menuGroupId,
          )
      ],
      childrenPadding: EdgeInsets.only(left: 16),
    );
  }

  copyWith({
    String title,
    Widget icon,
    bool isActive,
    int indexActiveItem,
    int menuGroupId,
    List<TagMenuItem> submenus,
  }) {
    return TagMenuGroup(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      submenus: submenus ?? this.submenus,
      isActive: isActive ?? this.isActive,
      indexActiveItem: indexActiveItem ?? this.indexActiveItem,
      menuGroupId: menuGroupId ?? this.menuGroupId,
    );
  }
}
