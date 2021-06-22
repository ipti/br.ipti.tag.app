import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/components.dart';
import 'package:orbit_ui_tag/strings/file_paths.dart';

class TagIconApple extends StatelessWidget {
  const TagIconApple({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagIcon(path: FilePaths.ICON_APPLE_SVG);
  }
}
