import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/address/_address_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/filliation/_filiation_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/_classes_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_bloc.dart';
import 'form/personal/_personal_form_partial_page.dart';
import 'form/social/_social_form_partial_page.dart';

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
          const TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: tabs,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: 800,
            ),
            child: const TabBarView(
              children: [
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
