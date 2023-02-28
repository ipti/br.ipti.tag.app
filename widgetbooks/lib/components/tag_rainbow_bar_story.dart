import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent rainbowBar() => WidgetbookComponent(
      name: 'Tag_RainbowBar',
      useCases: [
        WidgetbookUseCase(
            name: 'RainbowBar',
            builder: (context) {
              return const TagRainbowBar();
            }),
      ],
    );
