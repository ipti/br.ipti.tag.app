import 'package:example/components/tag_app_bar_story.dart';
import 'package:example/components/tag_box_story.dart';
import 'package:example/components/tag_breadcrumb_story.dart';
import 'package:example/components/tag_button_story.dart';
import 'package:example/components/tag_checkbox_story.dart';
import 'package:example/components/tag_datatable_story.dart';
import 'package:example/components/tag_datepicker_story.dart';
import 'package:example/components/tag_dropdown_story.dart';
import 'package:example/components/tag_empty_story.dart';
import 'package:example/components/tag_headings_story.dart';
import 'package:example/components/tag_icons_story.dart';
import 'package:example/components/tag_label_story.dart';
import 'package:example/components/tag_link_button_story.dart';
import 'package:example/components/tag_logo_story.dart';
import 'package:example/components/tag_menu_story.dart';
import 'package:example/components/tag_rainbow_bar_story.dart';
import 'package:example/components/tag_scaffold_story.dart';
import 'package:example/components/tag_text_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'material',
          widgets: [
            buttonStory(),
            appBarStory(),
            boxStory(),
            breadcrumb(),
            checkbox(),
            dropdown(),
            datepicker(),
            datatable(),
            empty(),
            heading(),
            icons(),
            label(),
            linkButton(),
            logo(),
            menu(),
            rainbowBar(),
            scaffold(),
            textField()
          ],
        ),
      ],
      appInfo: AppInfo(name: '{{name}}'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
    );
  }
}
