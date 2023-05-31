// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class DetailsStudentClassDiary extends StatefulWidget {
  final String title;

  const DetailsStudentClassDiary({
    Key? key,
    this.title = "Diario de classes",
  }) : super(key: key);

  @override
  State<DetailsStudentClassDiary> createState() =>
      _DetailsStudentClassDiaryState();
}

class _DetailsStudentClassDiaryState extends State<DetailsStudentClassDiary> {
  late bool check = false;
  late TabController _tabController;

static const List<Tab> _tabs = [
    Tab(
      child: Text("Diário de Aula por Aluno"),
    ),
  ];

  void onTap() {
    const index = 0;
    _tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: TagScaffold(
        menu: const TagVerticalMenu(),
        appBar: const CustomAppBar(),
        title: "ADERSON NASC. ROSA",
        path: [TagPath("", "Inicio"), AppRoutes.classDiary],
        body: Column(children: [

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0,),
            child: TagTextField(label: "Observação"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Checkbox(value: check, onChanged: (newState) {
                  setState(() {
                    check = newState!;
                  });
                },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Checkbox(value: check, onChanged: (newState) {
                  setState(() {
                    check = newState!;
                  });
                },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Checkbox(value: check, onChanged: (newState) {
                  setState(() {
                    check = newState!;
                  });
                },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Checkbox(value: check, onChanged: (newState) {
                  setState(() {
                    check = newState!;
                  });
                },),
          ),
        ],),
      ),
    );
  }
}
