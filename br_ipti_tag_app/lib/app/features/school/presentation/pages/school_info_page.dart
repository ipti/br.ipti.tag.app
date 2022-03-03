import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class SchoolInfoPage extends StatelessWidget {
  const SchoolInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      title: 'Dados cadastrais',
      description: '',
      menu: const TagVerticalMenu(),
      body: [],
      path: [],
    );
  }
}
