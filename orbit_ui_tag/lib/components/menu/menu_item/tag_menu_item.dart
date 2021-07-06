import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/menu/menu_controller.dart';
import 'package:orbit_ui_tag/design_tokens/colors.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuItem extends StatelessWidget implements ITagMenuItem {
  const TagMenuItem({
    Key key,
    @required this.title,
    @required this.onTap,
    this.icon,
    this.isActive = false,
    this.menuGroupId,
    this.menuItemId,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final int menuGroupId;
  final int menuItemId;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: TagColors.colorTextButtonPrimary,
      // fontWeight: TagFontWeight.fontWeightLinks,
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
          menuController.indexMenuGroup.value = menuGroupId;
          menuController.indexMenuItem.value = menuItemId;
          onTap.call();
        },
      ),
    );
  }

  copyWith({
    String title,
    Function onTap,
    bool isActive,
    int menuGroupId,
    int menuItemId,
  }) {
    return TagMenuItem(
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
      isActive: isActive ?? this.isActive,
      menuGroupId: menuGroupId ?? this.menuGroupId,
      menuItemId: menuItemId ?? this.menuItemId,
    );
  }
}
