// ignore_for_file: public_member_api_docs, sort_constructors_first
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

    const materia = <MateriasNotas>[
      MateriasNotas(name: "Matemática", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Português", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Historia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Geografia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Geografia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Geografia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Geografia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
      MateriasNotas(name: "Geografia", n1: "n1", n2: "n2", n3: "n3", n4: "n4"),
    ];

    return TagScaffold(
      title: widget.student.name,
      path: const [AppRoutes.notes],
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
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
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 1,
                color: TagColors.colorBaseInkLight,
              ),
            ),
            ListView.builder(
              itemCount: materia.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(materia[index].name),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1,
                              width: 64,
                              color: TagColors.colorBaseInkLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Row(
                        children: const [
                          TagTextFieldNumber(
                            label: "1º",
                          ),
                          TagTextFieldNumber(
                            label: "2º",
                          ),
                          TagTextFieldNumber(
                            label: "3º",
                          ),
                          TagTextFieldNumber(
                            label: "4º",
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  TagButton(text: "Salvar", onPressed: () => {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MateriasNotas {
  final String name;
  final String n1;
  final String n2;
  final String n3;
  final String n4;
  const MateriasNotas({
    required this.name,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
  });
}
