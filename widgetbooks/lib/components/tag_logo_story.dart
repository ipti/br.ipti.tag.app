import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent logo() => WidgetbookComponent(
      name: 'Tag_Logo',
      useCases: [
        WidgetbookUseCase(
            name: 'Logo',
            builder: (context) {
              return const Center(child: TagLogo());
            }),
      ],
    );
