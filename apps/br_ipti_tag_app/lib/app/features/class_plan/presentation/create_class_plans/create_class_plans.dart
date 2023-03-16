// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../core/util/routes/routes.dart';

class CreateClassPlans extends StatefulWidget {
  const CreateClassPlans({
    super.key,
    this.title = "Criar Plano",
  });

  final String title;

  @override
  State<CreateClassPlans> createState() => _CreateClassPlansState();
}

class _CreateClassPlansState extends State<CreateClassPlans> {
  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [TagPath("", "Inicio"), TagPath("", widget.title)],
      body: Column(
        children: const [Text('data')],
      ),
    );
  }
}
