import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent heading() => WidgetbookComponent(
      name: 'Tag_Heading',
      useCases: [
        WidgetbookUseCase(
            name: 'Heading',
            builder: (context) {
              return Center(
                child: Column(
                  children: [
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading DisplayTitle',
                            initialValue: 'Default'),
                        type: HeadingType.DisplayTitle),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading DisplaySubtitle',
                            initialValue: 'Default'),
                        type: HeadingType.DisplaySubtitle),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading Title1',
                            initialValue: 'Default'),
                        type: HeadingType.Title1),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading Title2',
                            initialValue: 'Default'),
                        type: HeadingType.Title2),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading Title3',
                            initialValue: 'Default'),
                        type: HeadingType.Title3),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading Title4',
                            initialValue: 'Default'),
                        type: HeadingType.Title4),
                    Heading(
                        text: context.knobs.text(
                            label: 'textHeading Title5',
                            initialValue: 'Default'),
                        type: HeadingType.Title5),
                  ],
                ),
              );
            }),
      ],
    );
