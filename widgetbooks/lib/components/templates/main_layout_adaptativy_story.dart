import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent mainLayoutAdaptativyStory() =>
    WidgetbookComponent(name: "MainLayoutAdaptativy", useCases: [
      WidgetbookUseCase(
          name: "MainLayoutAdaptativy",
          builder: (context) {
            return MaterialApp(
              home: Scaffold(
                  body: MainLayoutAdaptativy(
                left: Container(
                  color: const Color.fromARGB(249, 40, 72, 212),
                  key: const Key("mobile"),
                ),
                body: Container(
                  color: const Color.fromARGB(220, 252, 102, 2),
                  key: const Key("mobile"),
                ),
                right: Container(
                  color: const Color.fromARGB(251, 214, 17, 17),
                  key: const Key("mobile"),
                ),
              )),
            );
          })
    ]);
