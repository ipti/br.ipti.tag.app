import 'package:flutter/src/widgets/basic.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent label() => WidgetbookComponent(
      name: 'Tag_Label',
      useCases: [
        WidgetbookUseCase(
            name: 'Label',
            builder: (context) {
              return Center(
                child: TagLabel(context.knobs
                    .text(label: 'inputLabel', initialValue: 'default')),
              );
            }),
      ],
    );
