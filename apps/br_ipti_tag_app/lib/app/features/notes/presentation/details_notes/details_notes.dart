import 'package:br_ipti_tag_app/app/features/notes/presentation/details_classroom/details_classroom.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../core/util/routes/routes.dart';
import '../../../../core/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/widgets/menu/vertical_menu.dart';

class DetailsNotes extends StatefulWidget {
  const DetailsNotes({super.key, required this.student});
  final StudentClassRoom student;

  @override
  State<DetailsNotes> createState() => _DetailsNotesState();
}

class _DetailsNotesState extends State<DetailsNotes> {
  @override
  Widget build(BuildContext context) {
    const itemSectionTitle = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return TagScaffold(
      title: widget.student.name,
      path: const [AppRoutes.notes],
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Matéria",
                  style: itemSectionTitle,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 64.0),
                  child: Text(
                    "Avaliações",
                    style: itemSectionTitle,
                  ),
                ),
              ],
            ),
          ),
          
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                height: 1,
                color: TagColors.colorBaseInkLight,
              ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(children: const [
              Text("Matemática"),
              
          ],),
          
           ),
           TagTextField(label: "label"),
           Row(
            children: [
               TagButton(text: "Salvar", onPressed: () => {}),
             ],
           ),
        ],
      ),
    );
  }
}
