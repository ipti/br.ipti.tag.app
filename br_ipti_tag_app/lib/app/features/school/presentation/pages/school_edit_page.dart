import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolEditPage extends StatefulWidget {
  const SchoolEditPage({Key? key}) : super(key: key);

  @override
  _SchoolEditPageState createState() => _SchoolEditPageState();
}

class _SchoolEditPageState extends State<SchoolEditPage> {
  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      title: 'Editar dados cadastrais',
      description: '',
      menu: const TagVerticalMenu(),
      body: [],
      path: [],
    );
  }
}
