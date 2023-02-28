import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent appBarStory() => WidgetbookComponent(
      name: 'Tag_AppBar',
      useCases: [
        WidgetbookUseCase(
            name: 'AppBar',
            builder: (context) {
              return const MaterialApp(
                home: Scaffold(
                  appBar: TagAppBar(),
                ), //or your Page with Scaffold
              );
            }),
      ],
    );
