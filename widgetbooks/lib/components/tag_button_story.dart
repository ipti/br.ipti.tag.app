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
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    icon: FilePaths.ICON_APPLE_BLUE_SVG,
                    text: '',
                    onPressed: () => log("message")),
              );
            }),
      ],
    );
