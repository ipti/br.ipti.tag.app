import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_bloc.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({Key? key, this.title = 'Matrícula'}) : super(key: key);

  final String title;

  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc> {
  @override
  void initState() {
    Modular.to.navigate('/alunos/matricula/pessoal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Tab(
        child: Text("Dados do aluno"),
      ),
      Tab(
        child: Text("Filiação"),
      ),
      Tab(
        child: Text("Endereço"),
      ),
      Tab(
        child: Text("Social"),
      ),
      Tab(
        child: Text("Matrícula"),
      )
    ];
    return DefaultTabController(
      length: tabs.length,
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
            tabs: tabs,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: 800,
            ),
            child: Expanded(
              child: RouterOutlet(),
            ),
          ),
        ],
      ),
    );
  }
}
