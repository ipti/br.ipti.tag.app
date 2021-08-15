import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class LayoutTopBarAndBody extends StatelessWidget {
  const LayoutTopBarAndBody({Key key, @required this.body, this.drawer})
      : super(key: key);

  final Widget body;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TagBackgroundColors.backgroundBody,
      drawer: drawer,
      appBar: TagAppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _LayoutPages(center: body),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}