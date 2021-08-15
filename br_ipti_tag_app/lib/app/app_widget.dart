//  app_widget.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:device_preview/device_preview.dart';
import 'package:orbit_ui_tag/design_tokens/tokens.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      isToolbarVisible: true,
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: "/alunos/matricula-rapida/personal",
        color: TagBackgroundColors.backgroundBody,
      ).modular(),
    );
  }
}
