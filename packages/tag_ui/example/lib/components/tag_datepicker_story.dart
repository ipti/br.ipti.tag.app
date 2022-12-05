import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent datepicker() => WidgetbookComponent(
      name: 'Tag_DataPicker',
      useCases: [
        WidgetbookUseCase(
            name: 'DatePicker',
            builder: (context) {
              return MaterialApp(
                home: Scaffold(
                  body: TagDatePickerField(
                    label: 'Data',
                    onChanged: (newValue) => log('message'),
                  ),
                  //  TagDatePickerField(label: context.knobs.text(label: 'gc')),
                ), //or your Page with Scaffold
              );
            }),
      ],
    );
