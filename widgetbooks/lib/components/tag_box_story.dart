import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

const textStyleTitleCard = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: TagColors.colorBaseInkNormal,
);

WidgetbookComponent boxStory() => WidgetbookComponent(
      name: 'Tag_Box',
      useCases: [
        WidgetbookUseCase(
            name: 'Box',
            builder: (context) {
              const textStyleTitleCard = TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: TagColors.colorBaseInkNormal,
              );

              return TagBox(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(24),
                  dense: true,
                  horizontalTitleGap: 4,
                  title: Text(
                    context.knobs
                        .text(label: 'textBox', initialValue: 'default'),
                    style: textStyleTitleCard,
                  ),
                  //subtitle: Text(subtitle),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: TagColors.colorBaseBlueNormal,
                  ),
                  onTap: () => () => log("sabnjsd"),
                ),
              );
            }),
      ],
    );
