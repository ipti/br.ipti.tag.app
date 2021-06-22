import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/logo/logo.dart';
import 'package:orbit_ui_tag/components/menu/i_tag_menu_item.dart';
import 'package:orbit_ui_tag/design_tokens/backgrounds.dart';

class TagMenu extends StatelessWidget {
  const TagMenu({Key key, @required this.items}) : super(key: key);

  final List<ITagMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors
            .transparent, //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: TagBackgroundColors.backgroundAppbar,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: TagBackgroundColors.backgroundAppbar,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                ),
                child: LogoTag(
                  width: 80,
                  color: Colors.white,
                ),
              ),
              ...items
            ],
          ),
        ),
      ),
    );
  }
}
