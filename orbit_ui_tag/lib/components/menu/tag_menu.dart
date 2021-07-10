import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/components.dart';
import 'package:orbit_ui_tag/components/logo/logo.dart';
import 'package:orbit_ui_tag/design_tokens/backgrounds.dart';

class TagMenu extends StatelessWidget {
  const TagMenu({
    Key key,
    @required this.items,
    this.initialRoute,
  }) : super(key: key);

  final String initialRoute;
  final List<TagMenuGroup> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
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
                    width: 40,
                    color: Colors.white,
                  ),
                ),
                for (var i = 0; i < items.length; i++)
                  items[i].copyWith(
                    menuGroupId: i,
                    isActive: items[i]
                        .submenus
                        .any((TagMenuItem s) => s.route == initialRoute),
                    routeActiveItem: initialRoute,
                  )
              ],
            )),
      ),
    );
  }
}
