import 'package:flutter/widgets.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class TagMobileMenu extends StatelessWidget {
  const TagMobileMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagMenu(
      items: [
        TagMenuGroup(
          icon: TagIconPersons(),
          title: "Turmas",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              onTap: () {},
            )
          ],
        ),
        TagMenuGroup(
          icon: TagIconPersons(),
          title: "Alunos",
          submenus: [
            TagMenuItem(
              title: "Matricula Rápida",
              onTap: () {},
            )
          ],
        ),
        TagMenuGroup(
          icon: TagIconPencil(),
          title: "Professores",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              onTap: () {},
            )
          ],
        ),
        TagMenuGroup(
          icon: TagIconTruck(),
          title: "Transportes",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              onTap: () {},
            )
          ],
        ),
        TagMenuGroup(
          icon: TagIconApple(),
          title: "Merenda",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
