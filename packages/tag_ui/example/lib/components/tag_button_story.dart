import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent buttonStory() => WidgetbookComponent(
      name: 'Tag_ButtonText',
      useCases: [
        WidgetbookUseCase(
            name: 'ButtonText',
            builder: (context) {
              return Center(
                child: TagButton(
                    text: context.knobs
                        .text(label: 'textbutton', initialValue: 'default'),
                    onPressed: () => log("message")),
              );
            }),
        WidgetbookUseCase(
            name: 'ButtonIcon',
            builder: (context) {
              return Center(
                child: TagButton(
                    icon: FilePaths.LOGO_GREY_PATH_SVG,
                    text: '',
                    onPressed: () => log("message")),
              );
            }),
      ],
    );
