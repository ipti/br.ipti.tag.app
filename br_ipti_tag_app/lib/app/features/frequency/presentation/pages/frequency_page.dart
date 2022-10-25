import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({super.key, this.title = "Frequência"});

  final String title;

  @override
  State<FrequencyPage> createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      title: "Frequencia",
      path: [widget.title],
      description: "",
      menu: const TagVerticalMenu(),
      body: Container(),
    );
  }
}
