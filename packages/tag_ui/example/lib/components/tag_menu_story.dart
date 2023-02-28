import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent menu() => WidgetbookComponent(
      name: 'Tag_Menu',
      useCases: [
        WidgetbookUseCase(
            name: 'Menu',
            builder: (context) {
              return MaterialApp(
                home: Scaffold(
                    body: TagMenu(
                  items: const [],
                  currentPathMenu: '/',
                  onTapDefault: (route) => log('message'),
                )), //or your Page with Scaffold
              );
            }),
      ],
    );
