// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/class_plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final etapas = <Etapas>[Etapas(name: 'name')];

  final planClass = Modular.get<ControllerPlanClass>();

  @override
  Widget build(BuildContext context) {
    return TagScaffold(
      menu: const TagVerticalMenu(),
      appBar: const CustomAppBar(),
      title: widget.title,
      path: [TagPath("", "Inicio"), TagPath("", widget.title)],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Plano de Aula"),
                    ),
                    Container(
                      height: 2,
                      width: 128,
                      color: TagColors.colorBaseInkNormal,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TagButton(text: "+ Conteudo", onPressed: () => {}),
                      TagButton(text: "+ Recurso", onPressed: () => {}),
                      TagButton(text: "+ Tipo", onPressed: () => {}),
                    ],
                  ),
                ),
                TagDropdownField<Etapas>(
                    onChanged: (e) => {},
                    label: "Etapas",
                    items: Map.fromEntries(
                      etapas!.map(
                        (e) => MapEntry(e, e.name),
                      ),
                    ),),
                TagDropdownField<Etapas>(
                    onChanged: (e) => {},
                    label: "Diciplinas",
                    items: Map.fromEntries(
                      etapas!.map(
                        (e) => MapEntry(e, e.name),
                      ),
                    ),),
                const TagTextField(label: 'Name'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TagButton(text: 'Salvar', onPressed: () => {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Container(
                        height: 1,
                        color: TagColors.colorBaseInkLight,
                        
                      ),
                ),
                const Text('Aula'),
                if(planClass.state.newclass)
                  NewClass(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  TagButton(text: "+ Novo", onPressed: () => planClass.openNew(),),
                ],),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewClass extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(children: const [
       Text("data"),
    ],);
  }}