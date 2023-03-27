import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/add_ability.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/expansion_plane/expansion_plane.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class NewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const styleTitle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
    final controller = Modular.get<CreateClassBloc>();

    return BlocBuilder<CreateClassBloc, CreateClassState>(
       bloc: controller,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(!controller.state.openForm) 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    color: Color.fromRGBO(180, 219, 248, 1),
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
            if (controller.state.openForm) const Steps(classes: [Classes([],'object', 'types', 'resource', false)]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TagButton(text: "Novo", onPressed: controller.newClass),
              ],
            ),
          ],
        );
      },
    );
  }
}

class NewClassForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TagButton(text: "+ Habilidades", onPressed:  () async {
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
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Container(height: 1, color: TagColors.colorBaseCloudLightHover,),
                    ),
                    const Text('Habilidades'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Container(height: 1, color: TagColors.colorBaseCloudLightHover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: const [
                            SizedBox(child: Text('+'), width: 10),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "(EF01LP01) Reconhecer que textos são lidos e escritos da esquerda para a direita e de cima para baixo da página.", ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
