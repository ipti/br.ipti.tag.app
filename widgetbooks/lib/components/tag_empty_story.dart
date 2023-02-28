import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent empty() => WidgetbookComponent(
      name: 'Tag_Empty',
      useCases: [
        WidgetbookUseCase(
            name: 'Empty',
            builder: (context) {
              return const TagEmpty();
            }),
      ],
    );
