import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagMenu extends StatelessWidget {
  const TagMenu({
    super.key,
    required this.items,
    required this.currentPathMenu,
    required this.onTapDefault,
  });

  final List<TagMenuItemProps> items;
  final String currentPathMenu;
  final void Function(String route) onTapDefault;

  @override
  Widget build(BuildContext context) {
    final _items = [
      for (var i in items)
        TagMenuItem(
          props: TagMenuItemProps(
            path: i.path,
            isActive: currentPathMenu.contains(i.path.path),
            icon: i.icon,
          ),
          onTap: i.onTap ?? onTapDefault,
        ),
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: TagColors.colorBaseProductLight,
      ),
      child: Drawer(
        elevation: 0,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const TagLogo(
                      width: 64,
                    ),
                  ),
                  ..._items
                ],
              ),
            ),
            const TagRainbowBar(),
          ],
        ),
      ),
    );
  }
}
