// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:tag_ui/tag_ui.dart';

class AvaliableStudentList extends StatefulWidget {
  final String title;
  const AvaliableStudentList({
    super.key,
    this.title = "Avaliação de alunos",
  });

  @override
  State<AvaliableStudentList> createState() => _AvaliableStudentListState();
}

class _AvaliableStudentListState extends State<AvaliableStudentList> {
  @override
  Widget build(BuildContext context) {
    return TagScaffold(
        menu: const TagVerticalMenu(),
        appBar: const CustomAppBar(),
        title: widget.title,
        path: [TagPath("", "Inicio"), AppRoutes.classDiary],
        body: Column(
          children: [
            
          ],
        ),);
  }
}
