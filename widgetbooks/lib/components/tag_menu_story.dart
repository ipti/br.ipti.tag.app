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
                      path: const TagPath("alunos", "Alunos"),
                      onTap: (context) => log("Alunos"),
                    ),
                    TagMenuItemProps(
                      path: const TagPath("professores", "Professores"),
                      onTap: (context) => log("Professores"),
                    ),
                    TagMenuItemProps(
                      path: const TagPath("transporte", "Transporte"),
                      onTap: (context) => log("Transporte"),
                    ),
                  ],
                  currentPathMenu:
                      context.knobs.options(label: "PathMenu", options: [])
                  // .text(label: 'PathMenu', initialValue: 'default')
                  ,
                  onTapDefault: (context) => log('message'),
                )), //or your Page with Scaffold
              );
            }),
      ],
    );
