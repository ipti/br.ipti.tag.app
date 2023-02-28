// import 'package:flutter/material.dart';
// import 'package:tag_ui/tag_ui.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent layoutTopbarAndBodyStory() =>
    WidgetbookComponent(name: "Tag_LayoutTopbarAndBody", useCases: [
      WidgetbookUseCase(
          name: "LayoutTopbarAndBody",
          builder: (context) {
            return MaterialApp(
              home: Scaffold(
                body: LayoutTopBarAndBody(
                  appBar: const TagAppBar(),
                  drawer: Container(
                    color: const Color.fromARGB(249, 191, 17, 214),
                  ),
                  body: Container(
                    color: const Color.fromARGB(250, 112, 214, 17),
                  ),
                ),
              ),
            );
          }),
    ]);
