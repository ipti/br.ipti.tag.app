import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent icons() => WidgetbookComponent(
      name: 'TagIcons',
      useCases: [
        WidgetbookUseCase(
            name: 'LOGO_GREY_PATH_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.LOGO_GREY_PATH_SVG,
                    disabledVersionPath: FilePaths.LOGO_GREY_PATH_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'LOGO_LIGHT_PATH_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.LOGO_LIGHT_PATH_SVG,
                    disabledVersionPath: FilePaths.LOGO_LIGHT_PATH_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'LOGO_PATH_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.LOGO_PATH_SVG,
                    disabledVersionPath: FilePaths.LOGO_PATH_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_APPLE_BLUE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_APPLE_BLUE_SVG,
                    disabledVersionPath: FilePaths.ICON_APPLE_BLUE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_APPLE_GREY_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_APPLE_GREY_SVG,
                    disabledVersionPath: FilePaths.ICON_APPLE_GREY_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_CLOSE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_CLOSE_SVG,
                    disabledVersionPath: FilePaths.ICON_CLOSE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_HOME_BLUE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_HOME_BLUE_SVG,
                    disabledVersionPath: FilePaths.ICON_HOME_BLUE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_HOME_GREY_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_HOME_GREY_SVG,
                    disabledVersionPath: FilePaths.ICON_HOME_GREY_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_PENCIL_BLUE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG,
                    disabledVersionPath: FilePaths.ICON_PENCIL_BLUE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_PENCIL_GREY_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_PENCIL_GREY_SVG,
                    disabledVersionPath: FilePaths.ICON_PENCIL_GREY_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_PERSONS_BLUE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG,
                    disabledVersionPath: FilePaths.ICON_PERSONS_BLUE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_PERSONS_GREY_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_PERSONS_GREY_SVG,
                    disabledVersionPath: FilePaths.ICON_PERSONS_GREY_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_TRUCK_BLUE_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_TRUCK_BLUE_SVG,
                    disabledVersionPath: FilePaths.ICON_TRUCK_BLUE_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'ICON_TRUCK_GREY_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.ICON_TRUCK_GREY_SVG,
                    disabledVersionPath: FilePaths.ICON_TRUCK_GREY_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'IMPRESSORA_ICON_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.IMPRESSORA_ICON_SVG,
                    disabledVersionPath: FilePaths.IMPRESSORA_ICON_SVG),
              );
            }),
        WidgetbookUseCase(
            name: 'INFO_ICON_SVG',
            builder: (context) {
              return Center(
                child: TagIcon(
                    defaultVersionPath: FilePaths.INFO_ICON_SVG,
                    disabledVersionPath: FilePaths.INFO_ICON_SVG),
              );
            }),
      ],
    );
