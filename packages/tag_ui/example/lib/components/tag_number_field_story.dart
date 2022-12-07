import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent numberField() => WidgetbookComponent(
      name: 'Tag_NumberField',
      useCases: [
        WidgetbookUseCase(
            name: 'NumberField',
            builder: (context) {
              return Center(
                child: MaterialApp(
                  home: Scaffold(
                    body: Center(
                      child: TagNumberField(onChanged: (value) {
                        value++;
                      }),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
