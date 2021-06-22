import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/components.dart';
import 'package:orbit_ui_tag/strings/file_paths.dart';

class TagIconTruck extends StatelessWidget {
  const TagIconTruck({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagIcon(path: FilePaths.ICON_TRUCK_SVG);
  }
}
