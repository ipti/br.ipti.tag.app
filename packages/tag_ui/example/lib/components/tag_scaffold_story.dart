import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent scaffold() => WidgetbookComponent(
      name: 'Tag_Scaffold',
      useCases: [
        WidgetbookUseCase(
            name: 'Scaffold',
            builder: (context) {
              return MaterialApp(
                home: TagScaffold(
                  title: "Bem Vinda(o)!",
                  menu: TagMenu(
                    items: const [],
                    currentPathMenu: '/',
                    onTapDefault: (route) => log('message'),
                  ),
                  description: "",
                  body: Column(),
                  path: const [],
                ),
              );
            }),
      ],
    );
