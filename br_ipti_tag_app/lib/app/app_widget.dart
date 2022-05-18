//  app_widget.dart
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (BuildContext context) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: "/auth",
        color: TagColors.colorBaseWhiteNormal,
      ).modular(),
    );
  }
}
