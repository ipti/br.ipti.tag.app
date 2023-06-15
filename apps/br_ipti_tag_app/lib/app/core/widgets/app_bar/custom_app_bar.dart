import 'package:br_ipti_tag_app/app/core/widgets/app_bar/tag_appbar_user_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

// ignore: avoid_implementing_value_types
class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Modular.to.path.split('/').where((e) => e.isNotEmpty).length;
    final isRoot = count >= 2;
    const back = TagAppBarBackIconButton();
    const menu = TagAppBarMenuIconButton();
    final leading = isRoot ? back : menu;
    const actions = <Widget>[TagAppBarUserIconButton()];

    return TagAppBar(leading: leading,actions: actions);
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(TagSizes.heightServiceLogoMedium + 28);
}
