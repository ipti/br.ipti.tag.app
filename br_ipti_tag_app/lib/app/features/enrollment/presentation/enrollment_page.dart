import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'fast_enrollment/bloc/enrollment_bloc.dart';
import 'fast_enrollment/bloc/enrollment_events.dart';

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
    // Modular.to.navigate('/turmas/matricula-rapida/personal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: TagDefaultPage(
        menu: TagVerticalMenu(),
        title: widget.title,
        description: "",
        path: ["Alunos", widget.title],
        body: [
          Container(
            child: TabBar(
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
          ),
          Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
    );
  }
}
