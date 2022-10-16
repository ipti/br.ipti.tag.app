import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/education/bloc/instructor_education_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../bloc/create_instructor_bloc.dart';
import '../bloc/instructor_states.dart';
import 'address/address_social_form_partial_page.dart';

import 'address/bloc/instructor_address_bloc.dart';
import 'education/instructor_education_form_page.dart';
import 'personal/bloc/instructor_personal_bloc.dart';
import 'personal/personal_form_partial_page.dart';

class UpdateInstructorPage extends StatefulWidget {
  const UpdateInstructorPage({
    super.key,
    this.title = 'Editar',
    this.instructor,
    this.editMode = EditMode.Edit,
  });

  final String? title;
  final EditMode editMode;
  final Instructor? instructor;

  @override
  UpdateInstructorPageState createState() => UpdateInstructorPageState();
}

class UpdateInstructorPageState extends State<UpdateInstructorPage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<CreateInstructorBloc>();

  UpdateInstructorPageState() : super();

  final List<Tab> _tabs = const [
    Tab(
      child: Text("Dados do pessoais"),
    ),
    Tab(
      child: Text("Endereço"),
    ),
    Tab(
      child: Text("Dados Educacionais"),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    controller.stream.listen((state) {
      if (state.tabIndex != _tabController.index) {
        _tabController.animateTo(state.tabIndex);
      }
    });

    final objectId = widget.instructor?.id;
    if (objectId != null) {
      controller.fetch(objectId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: BlocConsumer<CreateInstructorBloc, InstructorFormState>(
        listener: (context, state) {
          if (state is CreateInstructorErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: TagColors.colorRedDark,
                content: Text(state.message),
              ),
            );
          }
          if (state is CreateInstructorSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: TagColors.colorBaseProductNormal,
                content: Text(state.message),
              ),
            );
          }
        },
        buildWhen: (previou, current) {
          return [InstructorFormStatus.Loaded, InstructorFormStatus.Empty]
              .contains(current.status);
        },
        bloc: controller,
        builder: (context, state) {
          return TagScaffold(
            // appBar: const TagAppBar(leading: TagAppBarBackIconButton(),),
            menu: const TagVerticalMenu(),
            title: widget.title!,
            description: "",
            path: ["Professor", widget.title!],
            body: Column(children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: TagColors.colorBaseProductDark,
                indicatorColor: TagColors.colorBaseProductDark,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                onTap: (value) => controller.goToTab(value),
                tabs: _tabs,
              ),
              if (state.status == InstructorFormStatus.Loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state.status == InstructorFormStatus.Loaded)
                LayoutBuilder(builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 200,
                      maxWidth: 800,
                    ),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        PersonalDataFormPage(
                          instructor: state,
                          editMode: widget.editMode,
                        ),
                        AddressFormPage(
                          instructor: state,
                          editMode: widget.editMode,
                        ),
                        InstructoEducationPage(
                          instructor: state,
                          editMode: widget.editMode,
                        ),
                      ],
                    ),
                  );
                }),
            ]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Modular.dispose<InstructorPersonalBloc>();
    Modular.dispose<InstructorAddressBloc>();
    Modular.dispose<InstructorEducationBloc>();
    super.dispose();
  }
}
