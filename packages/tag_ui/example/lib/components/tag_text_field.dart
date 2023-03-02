import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent textField() => WidgetbookComponent(
      name: 'Tag_TextFied',
      useCases: [
        WidgetbookUseCase(
            name: 'TextFied',
            builder: (context) {
              return MaterialApp(
                home: Center(
                  child: TagTextField(
                    label: context.knobs
                        .text(label: 'textFiled', initialValue: 'default'),
                  ),
                ),
              );
            }),
        WidgetbookUseCase(
            name: 'TextFiedCEP',
            builder: (context) {
              return MaterialApp(
                home: Center(
                  child: TagTextField(
                    label: context.knobs
                        .text(label: 'textFiled', initialValue: 'default'),
                    formatters: [TagMasks.maskCEP],
                    onChanged: (value) => log(value),
                  ),
                ),
              );
            }),
        WidgetbookUseCase(
            name: 'TextFiedCPF',
            builder: (context) {
              return MaterialApp(
                home: Center(
                  child: TagTextField(
                    label: context.knobs
                        .text(label: 'textFiled', initialValue: 'default'),
                    formatters: [TagMasks.maskCPF],
                    onChanged: (value) => log(value),
                  ),
                ),
              );
            }),
        WidgetbookUseCase(
            name: 'TextFiedDate',
            builder: (context) {
              return MaterialApp(
                home: Center(
                  child: TagTextField(
                    label: context.knobs
                        .text(label: 'textFiled', initialValue: 'default'),
                    formatters: [TagMasks.maskDate],
                    onChanged: (value) => log(value),
                  ),
                ),
              );
            }),
        WidgetbookUseCase(
            name: 'TextFiedTime',
            builder: (context) {
              return MaterialApp(
                home: Center(
                  child: TagTextField(
                    label: context.knobs
                        .text(label: 'textFiled', initialValue: 'default'),
                    formatters: [TagMasks.maskTime],
                    onChanged: (value) => log(value),
                  ),
                ),
              );
            }),
      ],
    );
