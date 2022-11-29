import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent checkbox() => WidgetbookComponent(
      name: 'Tag_CheckBox',
      useCases: [
        WidgetbookUseCase(
            name: 'Checkbox',
            builder: (context) {
              return MaterialApp(
                home: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TagCheckbox(
                        onChanged: (isChecked) => log('message'),
                        label: context.knobs.text(
                            label: 'textCheckbox', initialValue: 'default')),
                    TagCheckbox(
                        onChanged: (isChecked) => log('message'),
                        label: context.knobs.text(
                            label: 'textCheckbox', initialValue: 'default')),
                    TagCheckbox(
                        onChanged: (isChecked) => log('message'),
                        label: context.knobs.text(
                            label: 'textCheckbox', initialValue: 'default')),
                  ],
                ),
              );
            }),
      ],
    );
