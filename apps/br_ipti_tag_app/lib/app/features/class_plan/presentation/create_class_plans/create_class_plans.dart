// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_plans/create_plans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../bloc/class_plan_state.dart';
import 'create_class/create_class.dart';

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
  late TabController _tabController;
  final planClass = Modular.get<ControllerPlanClass>();

  static const List<Tab> _tabs = [
    Tab(
      child: Text("Criar Plano"),
    ),
    Tab(
      child: Text("Aula"),
    ),
  ];

  void onTap() {
    const index = 0;
    _tabController.index = index;
  }

  @override
  void initState() {
    // _tabController = TabController(length: _tabs.length, vsync: this);
    // _tabController.addListener(onTap);

    // if (widget.student != null) {
    //   final student = widget.student!;

    //   controller.loadStudent(student);

    //   controller.fetchStudentDocs(
    //     int.parse(student.inepId ?? '0'),
    //     student.schoolInepIdFk,
    //   );
    //   controller.fetchStudentsEnrollment(
    //     student.id!,
    //     student.schoolInepIdFk,
    //   );
    // }

    // planClass.stream.listen((state) {
    //   final nextIndex = _tabController.index + 1;
    //   final isLastTab = nextIndex == _tabs.length;
    //   if (state is EnrollmentNextTabState && !isLastTab) {
    //     _tabController.animateTo(nextIndex);
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<ControllerPlanClass, ClassPlanState>(
            bloc: planClass,
            builder: (context, state) {
              return _buildWithoutData();
            },
          ),
        ),
      ),
    );
  }

  TabBarView _buildWithoutData() {
    return TabBarView(
      // controller: _tabController,
      children: [
        CreatePlans(),
        NewClass(),
      ],
    );
  }
}

