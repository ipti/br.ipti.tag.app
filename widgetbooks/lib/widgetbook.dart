import 'package:tag_widgetbook/components/tag_app_bar_story.dart';
import 'package:tag_widgetbook/components/tag_box_story.dart';
import 'package:tag_widgetbook/components/tag_breadcrumb_story.dart';
import 'package:tag_widgetbook/components/tag_button_story.dart';
import 'package:tag_widgetbook/components/tag_checkbox_story.dart';
import 'package:tag_widgetbook/components/tag_datatable_story.dart';
import 'package:tag_widgetbook/components/tag_datepicker_story.dart';
import 'package:tag_widgetbook/components/tag_dropdown_story.dart';
import 'package:tag_widgetbook/components/tag_empty_story.dart';
import 'package:tag_widgetbook/components/tag_headings_story.dart';
import 'package:tag_widgetbook/components/tag_icons_story.dart';
import 'package:tag_widgetbook/components/tag_label_story.dart';
import 'package:tag_widgetbook/components/tag_link_button_story.dart';
import 'package:tag_widgetbook/components/tag_logo_story.dart';
import 'package:tag_widgetbook/components/tag_menu_story.dart';
import 'package:tag_widgetbook/components/tag_rainbow_bar_story.dart';
import 'package:tag_widgetbook/components/tag_scaffold_story.dart';
import 'package:tag_widgetbook/components/tag_text_field.dart';
import 'package:tag_widgetbook/components/templates/layout_left_and_body_story.dart';
import 'package:tag_widgetbook/components/templates/layout_left_body_right_story.dart';
import 'package:tag_widgetbook/components/templates/layout_topbar_and_body_story.dart';
import 'package:tag_widgetbook/components/templates/main_layout_adaptativy_story.dart';
import 'package:tag_widgetbook/components/tag_number_field_story.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      devices: [
        Device.mobile(
            name: "Celular",
            resolution: Resolution.dimensions(
                nativeWidth: 620, nativeHeight: 1200, scaleFactor: 1)),
        Device.desktop(
            name: "Desktop",
            resolution: Resolution.dimensions(
                nativeWidth: 1440, nativeHeight: 580, scaleFactor: 1))
      ],
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
            numberField(),
            rainbowBar(),
            scaffold(),
            textField(),
            layoutLeftAndBodyStory(),
            layoutLeftBodyRightStory(),
            layoutTopbarAndBodyStory(),
            mainLayoutAdaptativyStory()
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
