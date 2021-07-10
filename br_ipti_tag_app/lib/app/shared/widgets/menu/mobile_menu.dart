import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class TagMobileMenu extends StatelessWidget {
  const TagMobileMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagMenu(
      initialRoute: ModalRoute.of(context).settings.name,
      items: [
        TagMenuGroup(
          icon: TagIconPersons(),
          title: "Turmas",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              route: 'turmas/',
              onTap: (route) {},
            ),
          ],
        ),
        TagMenuGroup(
          icon: TagIconPersons(),
          title: "Alunos",
          submenus: [
            TagMenuItem(
              title: "Matricula",
              route: '/turmas/matricula',
              onTap: (route) {
                Modular.to.popAndPushNamed("/login");
              },
            ),
            TagMenuItem(
              title: "Matricula Rápida",
              route: '/turmas/matricula-rapida',
              onTap: (route) {
                Modular.to.popAndPushNamed(route);
              },
            )
          ],
        ),
        TagMenuGroup(
          icon: TagIconPencil(),
          title: "Professores",
          submenus: [
            TagMenuItem(
              title: "Ver turmas",
              route: '/',
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
              route: '/',
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
              route: '/',
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
