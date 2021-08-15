import 'package:br_ipti_tag_app/app/shared/widgets/templates/layout_topbar_and_body.dart';
import 'package:flutter/material.dart';

import 'layout_left_side_menu.dart';

class MainLayoutAdaptativy extends StatelessWidget {
  const MainLayoutAdaptativy({Key key, this.left, this.body, this.right})
      : super(key: key);

  final Widget left;
  final Widget body;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var isDesktop = constraints.maxWidth > 600;
        if (isDesktop) {
          return LayoutLeftSideMenu(
            body: body,
            left: left,
            right: right,
          );
        }
        return LayoutTopBarAndBody(body: body);
      },
    );
  }
}
