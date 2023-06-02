// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/widgets/avaliable_student/avaliable_student.dart';
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
    final Size size = MediaQuery.of(context).size;

    const styleText = TextStyle(
        color: TagColors.colorBaseProductDark,
        fontWeight: FontWeight.w500,
        fontSize: 16,);

    return DefaultTabController(
      length: _tabs.length,
      child: TagScaffold(
        menu: const TagVerticalMenu(),
        appBar: const CustomAppBar(),
        title: "ADERSON NASC. ROSA",
        path: [TagPath("", "Inicio"), AppRoutes.classDiary],
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Diário de Aula por Aluno",
                            style: styleText),
                        Container(
                          height: 1,
                          color: TagColors.colorBaseInkNormal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: TagTextField(label: "Observação", maxLines: 8),
            ),
            const AvaliableStudent(title: "Excelente"),
            const AvaliableStudent(title: "Bom"),
            const AvaliableStudent(title: "Regular"),
            const AvaliableStudent(title: "Apresenta Dificuldade"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Container(
                  width: size.width * 1,
                  child: TagButton(
                      text: "Salvar informação", onPressed: () => {}),),
            ),
          ],
        ),
      ),
    );
  }
}
