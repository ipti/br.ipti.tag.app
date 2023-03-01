import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent heading() => WidgetbookComponent(
      name: 'Tag_Heading',
      useCases: [
        WidgetbookUseCase(
            name: 'Heading',
            builder: (context) {
              return Heading(
                  text: context.knobs
                      .text(label: 'textHeading', initialValue: 'default'),
                  type: HeadingType.DisplaySubtitle);
            }),
      ],
    );
