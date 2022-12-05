// import 'package:flutter/material.dart';
// import 'package:tag_ui/tag_ui.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent layoutLeftBodyRightStory() =>
    WidgetbookComponent(name: "Tag_LayoutLeftBodyRight", useCases: [
      WidgetbookUseCase(
          name: "LayoutLeftBodyRight",
          builder: (context) {
            return MaterialApp(
                home: Scaffold(
              body: LayoutLeftBodyRight(
                  key: const Key("mobile"),
                  right: Container(
                    color: const Color.fromARGB(249, 11, 102, 34),
                  ),
                  left: Container(
                    color: const Color.fromARGB(250, 221, 2, 2),
                  ),
                  body: Container(
                    color: const Color.fromARGB(251, 155, 167, 165),
                  )),
            ));
          })
    ]);
