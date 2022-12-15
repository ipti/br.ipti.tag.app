import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent dropdown() => WidgetbookComponent(
      name: 'Tag_Dropdown',
      useCases: [
        WidgetbookUseCase(
            name: 'Dropdown',
            builder: (context) {
              return MaterialApp(
                home: TagDropdownField<String>(
                  onChanged: (newValue) => log('message'),
                  label: context.knobs.text(label: 'dropdown'),
                  items: Map.fromEntries(
                    [].map(
                      (e) => MapEntry(e, e),
                    ),
                  ),
                ),
              );
            }),
      ],
    );