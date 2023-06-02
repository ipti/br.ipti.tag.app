import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/widgets/create_plan/create_plan.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/widgets/filter_avaliable_student/filter_avaliable_student.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/widgets/list_students/list_students.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/tag_button_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class DetailsClassDiary extends StatefulWidget {
  final String title;

  const DetailsClassDiary({super.key, this.title = "Diário de Classe"});
  @override
  State<DetailsClassDiary> createState() => _DetailsClassDiaryState();
}

class _DetailsClassDiaryState extends State<DetailsClassDiary> {
  late bool _isCreate = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const styleText = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    );

    const styleRelator = TextStyle(
      color: TagColors.colorBaseProductLight,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [TagPath("", "Inicio"), AppRoutes.classDiary],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  TagButtonIcon(
                    label: "Imprimir",
                    onPressed: () => {},
                    icon: FilePaths.IMPRESSORA_ICON_SVG,
                  ),
                  const SizedBox(width: 20),
                  TagButtonIcon(
                    label: "Relatório Bolsa Família",
                    onPressed: () => {},
                    icon: FilePaths.IMPRESSORA_ICON_SVG,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: size.width * 1,
                decoration: BoxDecoration(
                  color: TagColors.colorOrangeNormal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: const [
                      Icon(Icons.info, color: TagColors.colorBaseProductLight,),
                      SizedBox(width: 5,),
                      Flexible(
                        child: Text(
                            "Relatório Final do aluno já disponível  para cadastro", style: styleRelator,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 1, color: TagColors.colorBaseCloudDark),
            const FilterAvaliableStudent(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: TagDropdownFieldMultiSelect(
                      onChanged: (e) => {},
                      label: "Conteúdo",
                      items: Map.fromEntries(
                        ["turma 1", "turma 2", "turma 3", "turma 4", "turma 5"]
                            .map(
                          (e) => MapEntry(e, e),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle light when tapped.
                              _isCreate = !_isCreate;
                            });
                          },
                          child: Icon(
                            !_isCreate
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            size: 36.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isCreate) const CreatePlan(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: TagColors.colorBaseCloudDark,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Nome", style: styleText),
                          Text("Faltas", style: styleText),
                        ],
                      ),
                    ),
                    Container(height: 2, color: TagColors.colorBaseInkLight),
                  ],
                ),
              ),
            ),
            ListStudents(),
          ],
        ),
      ),
    );
  }
}
