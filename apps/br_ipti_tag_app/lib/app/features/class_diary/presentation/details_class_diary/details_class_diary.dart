import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const styleText = TextStyle(
        color: TagColors.colorBaseInkLight,
        fontWeight: FontWeight.w700,
        fontSize: 16);

    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [TagPath("", "Inicio"), AppRoutes.classDiary],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TagButtonIcon(
                  label: "Imprimir",
                  onPressed: () => {},
                  icon: FilePaths.IMPRESSORA_ICON_SVG,
                ),
                SizedBox(width: 20),
                TagButtonIcon(
                  label: "Relatório Bolsa Família",
                  onPressed: () => {},
                  icon: FilePaths.IMPRESSORA_ICON_SVG,
                ),
              ],
            ),
          ),
          Container(height: 1, color: TagColors.colorBaseCloudDark),

          // Row(
          //   children: [
          //     const TagTextField(label: "label"),

          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              color: TagColors.colorBaseCloudDark,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
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
    );
  }
}
