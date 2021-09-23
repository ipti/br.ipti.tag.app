import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui_design_system/tag_ui_design_system.dart';

import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_events.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({Key key, this.title = 'Matrícula rápida'})
      : super(key: key);

  final String title;

  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    // Modular.to.navigate('/turmas/matricula-rapida/personal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        title: widget.title,
        description: "",
        path: ["Alunos", widget.title],
        body: [
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            onTap: controller.tabNavigation,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            tabs: const [
              Tab(
                child: Text("Dados do aluno"),
              ),
              Tab(
                child: Text("Endereço"),
              ),
              Tab(
                child: Text("Turma"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: RouterOutlet(),
            ),
          ),
        ],
      ),
    );
  }
}
