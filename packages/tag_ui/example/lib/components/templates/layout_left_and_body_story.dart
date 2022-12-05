import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent layoutLeftAndBodyStory() =>
    WidgetbookComponent(name: "Tag_LayoutLeftAndBody", useCases: [
      WidgetbookUseCase(
          name: "LayoutLeftAndBody",
          builder: (context) {
            return MaterialApp(
              home: Scaffold(
                body: LayoutLeftAndBody(
                  key: const Key("mobile"),
                  left: Container(
                    color: const Color.fromARGB(251, 214, 17, 17),
                  ),
                  body: Container(
                    color: const Color.fromARGB(250, 112, 214, 17),
                  ),
                ),
              ),
            );
          })
    ]);
