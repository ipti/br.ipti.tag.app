import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/form/address/bloc/enrollment_address_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/form/personal/bloc/enrollment_personal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/enrollment_bloc.dart';
import 'bloc/enrollment_states.dart';
import 'form/address/address_social_form_partial_page.dart';
import 'form/classroom/classes_form_partial_page.dart';
import 'form/filliation/bloc/enrollment_filiation_bloc.dart';
import 'form/filliation/filiation_form_partial_page.dart';
import 'form/personal/personal_form_partial_page.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({
    super.key,
    this.title = 'Matrícula',
    this.student,
    this.editMode = EditMode.Create,
  });

  final String title;
  final Student? student;
  final EditMode editMode;

  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends State<EnrollmentPage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<EnrollmentBloc>();
  static const List<Tab> _tabs = [
    Tab(
      child: Text("Dados do aluno"),
    ),
    Tab(
      child: Text("Filiação"),
    ),
    Tab(
      child: Text("Endereço e Social"),
    ),
    Tab(
      child: Text("Matrícula"),
    ),
  ];

  late TabController _tabController;

  void onTap() {
    if (controller.student == null) {
      const index = 0;
      _tabController.index = index;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(onTap);

    if (widget.student != null) {
      final student = widget.student!;

      controller.loadStudent(student);

      // controller.fetchStudentDocs(
      //   int.tryParse(student.inepId!) ?? 0,
      //   student.schoolInepIdFk!,
      // );
      // controller.fetchStudentsEnrollment(
      //   student.id!,
      //   student.schoolInepIdFk!,
      // );
    }

    controller.stream.listen((state) {
      final nextIndex = _tabController.index + 1;
      final isLastTab = nextIndex == _tabs.length;
      if (state is EnrollmentNextTabState && !isLastTab) {
        _tabController.animateTo(nextIndex);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: TagScaffold(
        appBar: const TagAppBar(leading: TagAppBarBackIconButton()),
        menu: const TagVerticalMenu(),
        title: widget.student?.name ?? widget.title,
        path: [AppRoutes.alunos, TagPath("", widget.title)],
        onTapBreadcrumb: (route) => Modular.to.pushNamed(route, forRoot: true),
        tabBar: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: TagColors.colorBaseProductDark,
          indicatorColor: TagColors.colorBaseProductDark,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          onTap: (value) => controller.setTabIndex(value),
          tabs: _tabs,
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height + 800,
            maxWidth: 800,
          ),
          child: BlocConsumer<EnrollmentBloc, EnrollmentState>(
            listener: (context, state) {
              if (state is EnrollmenErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: TagColors.colorRedDark,
                    content: Text(state.message),
                  ),
                );
              }
              if (state is EnrollmenSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: TagColors.colorBaseProductNormal,
                    content: Text(state.message),
                  ),
                );
              }
            },
            bloc: controller,
            builder: (context, state) {
              if (state is EnrollmentLoadedState) {
                return _buildWithData(state);
              }

              return _buildWithoutData();
            },
          ),
        ),
      ),
    );
  }

  TabBarView _buildWithData(EnrollmentLoadedState state) {
    return TabBarView(
      controller: _tabController,
      children: [
        PersonalDataFormPage(
          student: widget.student,
          editMode: widget.editMode,
        ),
        FiliationFormPage(
          student: widget.student,
        ),
        AddressFormPage(
          model: state.studentDocs,
          editMode: widget.editMode,
        ),
        ClassesFormPage(
          model: state.studentEnrollment,
          editMode: widget.editMode,
        ),
      ],
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
        AddressFormPage(
          editMode: widget.editMode,
        ),
        ClassesFormPage(
          editMode: widget.editMode,
        ),
      ],
    );
  }

  @override
  void dispose() {
    Modular.dispose<EnrollmentPersonalBloc>();
    Modular.dispose<EnrollmentFiliationBloc>();
    Modular.dispose<EnrollmentAddressBloc>();
    super.dispose();
  }
}
