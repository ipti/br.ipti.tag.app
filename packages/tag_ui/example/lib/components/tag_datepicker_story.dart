import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent datepicker() => WidgetbookComponent(
      name: 'Tag_DataPicker',
      useCases: [
        WidgetbookUseCase(
            name: 'DatePicker',
            builder: (context) {
              return const MaterialApp(
                home: Scaffold(
                    //  TagDatePickerField(label: context.knobs.text(label: 'gc')),
                    ), //or your Page with Scaffold
              );
            }),
      ],
    );
