import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_events.dart';

class EnrollmentPage extends StatefulWidget {
  final String title;
  const EnrollmentPage({Key key, this.title = 'Matrícula rápida'})
      : super(key: key);
  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    Modular.to.navigate('../personal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            drawer: buildDrawer(),
            appBar: buildAppBar(),
            body: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Heading(
                      text: widget.title,
                      type: HeadingType.Title1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis orci ligula, a viverra augue semper in. Quisque vulputate lobortis feugiat.",
                      style: TextStyle(
                        color: TagColors.colorTextSecondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    // height: 50,
                    child: TabBar(
                      labelColor: TagColors.colorTabIndicator,
                      indicatorColor: TagColors.colorTabIndicator,
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            Modular.to.navigate('../personal');
                            break;
                          case 1:
                            Modular.to.navigate('../address');
                            break;
                          case 2:
                            Modular.to.navigate('../classes');
                            break;
                          default:
                        }
                      },
                      tabs: [
                        Tab(
                          child: Text("Dados \ndo aluno"),
                        ),
                        Tab(
                          child: Text("Endereço"),
                        ),
                        Tab(
                          child: Text("Turma"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RouterOutlet(),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: TagBackgroundColors.backgroundAppbar,
      ),
      elevation: 0,
      backgroundColor: TagBackgroundColors.backgroundBody,
      title: Container(
        height: TagSizes.heightServiceLogoMedium,
        child: LogoTag(
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return TagMenu(
      items: [
        TagMenuGroup(
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
          icon: TagIconPersons(),
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
