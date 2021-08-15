import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/components/components.dart';
import 'package:orbit_ui_tag/strings/file_paths.dart';

class TagIconPersons extends StatelessWidget {
  const TagIconPersons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TagIcon(path: FilePaths.ICON_PERSONS_SVG);
  }
}
