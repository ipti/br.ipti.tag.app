import 'package:br_ipti_tag_app/app/shared/widgets/header/header_desktop.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_states.dart';
import 'form/address/_address_form_partial_page.dart';
import 'form/classroom/_classes_form_partial_page.dart';
import 'form/filliation/_filiation_form_partial_page.dart';
import 'form/personal/_personal_form_partial_page.dart';
import 'form/social/_social_form_partial_page.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({Key? key, this.title = 'Matrícula'}) : super(key: key);

  final String title;

  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends ModularState<EnrollmentPage, EnrollmentBloc>
    with SingleTickerProviderStateMixin {
  static const List<Tab> _tabs = [
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

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);

    controller.stream.listen((event) {
      final nextIndex = _tabController.index + 1;
      final isLastTab = nextIndex == _tabs.length;
      if (event is NextTabState && !isLastTab) {
        _tabController.animateTo(nextIndex);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        header: const HeaderDesktop(),
        title: widget.title,
        description: "",
        path: ["Alunos", widget.title],
        body: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            onTap: (value) => controller.setTabIndex(value),
            tabs: _tabs,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: 800,
            ),
            child: TabBarView(
              controller: _tabController,
              children: const [
                PersonalDataFormPage(),
                FiliationFormPage(),
                AddressFormPage(),
                SocialFormPage(),
                ClassesFormPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
