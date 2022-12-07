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
                home: Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TagCheckbox(
                          onChanged: (isChecked) => log('Primeiro'),
                          value: false,
                          label: context.knobs.text(
                              label: 'Checkbox falso por padrão',
                              initialValue: 'default')),
                      TagCheckbox(
                          onChanged: (isChecked) => log('Segundo'),
                          value: true,
                          label: context.knobs.text(
                              label: 'Checkbox verdadeiro por padrão',
                              initialValue: 'default')),
                      TagCheckbox(
                          onChanged: (isChecked) => log('Terceiro'),
                          disabled: true,
                          value: false,
                          label: context.knobs.text(
                              label: 'Checkbox desabilitado',
                              initialValue: 'default')),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
