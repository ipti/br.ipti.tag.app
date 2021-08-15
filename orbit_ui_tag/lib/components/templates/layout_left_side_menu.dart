import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class LayoutLeftSideMenu extends StatelessWidget {
  const LayoutLeftSideMenu({
    Key key,
    @required this.body,
    this.left,
    this.right,
  }) : super(key: key);

  final Widget left;
  final Widget body;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TagBackgroundColors.backgroundBody,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _LayoutPages(
          left: left,
          center: body,
          right: right,
        ),
      ),
    );
  }
}

class _LayoutPages extends StatelessWidget {
  const _LayoutPages({Key key, this.left, this.center, this.right})
      : super(key: key);

  final Widget left;
  final Widget center;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(flex: 3, child: left ?? Container()),
          Flexible(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: center,
            ),
          ),
          Flexible(flex: 3, child: right ?? Container()),
        ],
      ),
    );
  }
}
