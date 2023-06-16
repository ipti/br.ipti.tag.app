// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/add_ability.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/expansion_plane/expansion_plane.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class NewClass extends StatefulWidget {
  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  final controller = Modular.get<CreateClassBloc>();
  @override
  Widget build(BuildContext context) {
    const styleTitle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

    return BlocBuilder<CreateClassBloc, CreateClassState>(
      bloc: controller,
      builder: (context, state) {
        log(state.classes.toString());

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.classes.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ColoredBox(
                    color: const Color.fromRGBO(180, 219, 248, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text("Nenhuma aula cadastrada."),
                        ),
                      ],
                    ),
                  ),
                ),
              if (state.classes.isNotEmpty) Steps(classes: state.classes),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36.0),
                    child:
                        TagButton(text: "Novo", onPressed: controller.newClass),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewClassForm extends StatelessWidget {
  final controller = Modular.get<CreateClassBloc>();
  final int index;
  NewClassForm({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TagButton(
            text: "+ Habilidades",
            onPressed: () async {
              final success = await showDialog(
                context: context,
                builder: (_) {
                  return AddAbility();
                },
              );
            },
          ),
        ),
        const TagTextField(label: "Objetivo"),
        const TagTextField(label: "Tipo"),
        TagDropdownField(
          onChanged: (e) => {},
          label: 'Recurso(s)',
          padding: EdgeInsets.all(5),
          items: Map.fromEntries(
            ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
              (e) => MapEntry(e, e),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 1,
                color: TagColors.colorBaseCloudLightHover,
              ),
            ),
            const Text('Habilidades'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 1,
                color: TagColors.colorBaseCloudLightHover,
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: TagColors.colorBaseCloudNormal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: TagColors.colorBaseProductNormal,
                          width: 25,
                          height: 25,
                          child: const Icon(
                            Icons.done,
                            color: TagColors.colorBaseProductLighter,
                          ),
                        ),
                      ),
                      const Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "(EF01LP01) Reconhecer que textos são lidos e escritos da esquerda para a direita e de cima para baixo da página.",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TagButton(
                    text: 'Remover aula',
                    onPressed: () => {},
                    backgroundColor: TagColors.colorRedDark,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     TagButton(text: "+", onPressed: () => {}),
        //   ],
        // ),
      ],
    );
  }
}
