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
                  items: [
                    TagMenuItemProps(
                      path: const TagPath("", "Alunos"),
                      isActive: true,
                      onTap: (route) => log("Alunos"),
                    ),
                    TagMenuItemProps(
                      path: const TagPath("professores", "Professores"),
                      isActive: false,
                      onTap: (route) => log("Professores"),
                    ),
                    TagMenuItemProps(
                      path: const TagPath("transporte", "Transporte"),
                      isActive: false,
                      onTap: (route) => log("Transporte"),
                    ),
                  ],
                  currentPathMenu: '/',
                  onTapDefault: (route) => log('message'),
                )), //or your Page with Scaffold
              );
            }),
      ],
    );
