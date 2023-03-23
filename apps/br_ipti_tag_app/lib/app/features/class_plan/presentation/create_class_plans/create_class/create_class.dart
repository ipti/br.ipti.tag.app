import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/add_ability.dart';
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Aula',
                style: styleTitle,
              ),
            ),
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
            if (controller.state.openForm) NewClassForm(),
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const TagTextField(label: "Objetivo"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TagButton(text: "Habilidades", onPressed:  () async {
                    final success = await showDialog(
                      context: context,
                      builder: (_) {
                        return AddAbility();
                      },
                    );
                  },
                ),
        ),
        const TagTextField(label: "Tipo"),
        const TagTextField(label: "Conteudo"),
        TagDropdownField(
          onChanged: (e) => {},
          label: 'label',
          items: Map.fromEntries(
            ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
              (e) => MapEntry(e, e),
            ),
          ),
        ),
      ],
    );
  }
}
