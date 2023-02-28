import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent linkButton() => WidgetbookComponent(
      name: 'Tag_LinkButton',
      useCases: [
        WidgetbookUseCase(
            name: 'LinkButton',
            builder: (context) {
              return Center(
                child: TagLinkButton(
                  text: context.knobs
                      .text(label: 'textLinkButton', initialValue: 'default'),
                  onPressed: () => log('message'),
                ),
              );
            }),
      ],
    );
