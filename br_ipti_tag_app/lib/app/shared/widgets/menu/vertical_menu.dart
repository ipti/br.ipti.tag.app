import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class TagVerticalMenu extends StatelessWidget {
  const TagVerticalMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TagMenu(
          initialRoute: ModalRoute.of(context).settings.name,
          items: [
            TagMenuGroup(
              icon: TagIconPersons(),
              title: "Início",
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
                  route: '/auth/login',
                  onTap: (route) {
                    Modular.to.navigate(route);
                  },
                ),
                TagMenuItem(
                  title: "Matricula Rápida",
                  route: '/alunos/matricula-rapida',
                  onTap: (route) {
                    Modular.to.navigate(route);
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
                  title: "Estoque",
                  route: '/merenda/estoque',
                  onTap: (route) {
                    Modular.to.navigate(route);
                  },
                ),
                TagMenuItem(
                  title: "Cardápio",
                  route: '/merenda/cardapio',
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFF667DF4),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFFF45A5A),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFF66D654),
                ),
              ),
              Flexible(
                child: Container(
                  height: 4,
                  color: Color(0xFFEADA48),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
