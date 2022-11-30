import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent mainLayoutAdaptativyStory() =>
    WidgetbookComponent(name: "MainLayoutAdaptativy", useCases: [
      WidgetbookUseCase(
          name: "MainLayoutAdaptativy",
          builder: (context) {
            return const MaterialApp(
              home: Scaffold(body: MainLayoutAdaptativy()),
            );
          })
    ]);
