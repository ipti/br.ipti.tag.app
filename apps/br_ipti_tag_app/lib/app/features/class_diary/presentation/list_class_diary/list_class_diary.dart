import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_ui/tag_ui.dart';

class ListClassDiary extends StatefulWidget {
  final String title;

  const ListClassDiary({super.key, this.title = "Diário de Classe"});

  @override
  State<StatefulWidget> createState() => _ListClassDiary();
}

class _ListClassDiary extends State<ListClassDiary> {
  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [TagPath("", "Inicio"), AppRoutes.classDiary],
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TagDropdownField(
                      onChanged: (e) => {},
                      label: "Selecione a Matéria",
                      items: Map.fromEntries(
                        ["turma 1", "turma 2"].map(
                          (e) => MapEntry(e, e),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardClassDiary(),
              ),
            ],
          ),),
    );
  }
}
