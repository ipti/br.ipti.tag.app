// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/class_plan_cubit.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/add_resource.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/widget/add_type_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../core/util/routes/routes.dart';
import '../widget/add_content.dart';

class CreateClassPlans extends StatefulWidget {
  const CreateClassPlans({
    super.key,
    this.title = "Criar Plano",
  });

  final String title;

  @override
  State<CreateClassPlans> createState() => _CreateClassPlansState();
}

class _CreateClassPlansState extends State<CreateClassPlans> {
  final etapas = <Etapas>[const Etapas(name: 'name')];

  final planClass = Modular.get<ControllerPlanClass>();
 

  static const List<Tab> _tabs = [
    Tab(
      child: Text("Criar Plano"),
    ),
    Tab(
      child: Text("Aula"),
    ),
  ];

  

  @override
  Widget build(BuildContext context) {

    const styleTitle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

    return DefaultTabController(
      length: _tabs.length,
      child: TagScaffold(
        menu: const TagVerticalMenu(),
        appBar: const CustomAppBar(),
        title: widget.title,
        path: [const TagPath("", "Inicio"), TagPath("", widget.title)],
        tabBar: const TabBar(
           // controller: _tabController,
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
           // onTap: (value) => controller.setTabIndex(value),
            tabs: _tabs,
          ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TagButton(text: 'Salvar', onPressed: () => {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 1,
                      color: TagColors.colorBaseInkLight,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Aula', style: styleTitle,),
                  ),
                  BlocBuilder<ControllerPlanClass, PlanClassState>(
                    bloc: planClass,
                    builder: (context, state) {
                      return Column(
                        children: [
                          if (planClass.state.newclass) NewClass(),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TagButton(text: "+ Novo", onPressed: planClass.openNew),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

   
 TabBarView _buildWithoutData() {
    return TabBarView(
      controller: _tabController,
      children: [
        PersonalDataFormPage(
          editMode: widget.editMode,
        ),
        FiliationFormPage(
          student: widget.student,
        ),
      ],
    );
  }

}

class NewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        const TagTextField(label: "Objetivo"),
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
