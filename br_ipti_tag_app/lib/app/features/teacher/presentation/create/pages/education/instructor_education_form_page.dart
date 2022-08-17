import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/instructor_states.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/instructor_education_bloc.dart';
import 'bloc/instructor_education_states.dart';

class InstructoEducationPage extends StatefulWidget {
  const InstructoEducationPage({
    Key? key,
    this.instructor,
    this.editMode = EditMode.Create,
  }) : super(key: key);

  final EditMode editMode;
  final InstructorFormState? instructor;

  @override
  InstructoEducationPageState createState() => InstructoEducationPageState();
}

class InstructoEducationPageState extends State<InstructoEducationPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<InstructorEducationBloc>();

  @override
  void initState() {
    if (widget.editMode == EditMode.Edit) {
      controller.loadInstructorEducation(widget.instructor!);
      controller.autoUpdate();
    }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const heading = Heading(
      text: "Dados Educacionais",
      type: HeadingType.Title3,
    );

    final isDesktop = MediaQuery.of(context).size.width > 992;

    return BlocBuilder<InstructorEducationBloc, InstructorEducationState>(
      bloc: controller,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 16),
                    child: heading,
                  ),
                  const Heading(
                    text: "Pós-Graduação",
                    type: HeadingType.Title4,
                  ),
                  _FormPosGraduate(
                    controller: controller,
                    state: state,
                  ),
                  const Heading(
                    text: "Outros Cursos",
                    type: HeadingType.Title4,
                  ),
                  _FormOtherCourses(
                    controller: controller,
                    state: state,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: RowToColumn(
                      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          fit: isDesktop ? FlexFit.loose : FlexFit.tight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            child: TagButton(
                              text: "Salvar dados",
                              onPressed: submit,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.editMode == EditMode.Create) {
      controller.create();
    }
    if (widget.editMode == EditMode.Edit) {
      controller.edit();
    }
  }
}

class _FormPosGraduate extends StatelessWidget {
  const _FormPosGraduate({
    Key? key,
    required this.controller,
    required this.state,
  }) : super(key: key);

  final InstructorEducationBloc controller;
  final InstructorEducationState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagCheckbox(
          label: "Especialização",
          value: state.postGraduationSpecialization,
          onChanged: controller.setPostGraduationSpecialization,
        ),
        TagCheckbox(
          label: "Mestrado",
          value: state.postGraduationMaster,
          onChanged: controller.setPostGraduationMaster,
        ),
        TagCheckbox(
          label: "Doutorado",
          value: state.postGraduationDoctorate,
          onChanged: controller.setPostGraduationDoctorate,
        ),
      ],
    );
  }
}

class _FormOtherCourses extends StatelessWidget {
  const _FormOtherCourses({
    Key? key,
    required this.controller,
    required this.state,
  }) : super(key: key);

  final InstructorEducationBloc controller;
  final InstructorEducationState state;

  @override
  Widget build(BuildContext context) {
    return RowToColumn(
      children: [
        Flexible(
          child: Column(
            children: [
              TagCheckbox(
                label: "Creche",
                value: state.otherCoursesNursery,
                onChanged: controller.setOtherCoursesNursery,
              ),
              TagCheckbox(
                label: "Pré-Escola",
                value: state.otherCoursesPreSchool,
                onChanged: controller.setOtherCoursesPreSchool,
              ),
              TagCheckbox(
                label: "Anos iniciais do ensino fundamental",
                value: state.otherCoursesBasicEducationInitialYears,
                onChanged: controller.setOtherCoursesBasicEducationInitialYears,
              ),
              TagCheckbox(
                label: "Anos finais do ensino fundamental",
                value: state.otherCoursesBasicEducationFinalYears,
                onChanged: controller.setOtherCoursesBasicEducationFinalYears,
              ),
              TagCheckbox(
                label: "Ensino médio",
                value: state.otherCoursesHighSchool,
                onChanged: controller.setOtherCoursesHighSchool,
              ),
              TagCheckbox(
                label: "Educação especial",
                value: state.otherCoursesSpecialEducation,
                onChanged: controller.setOtherCoursesSpecialEducation,
              ),
              TagCheckbox(
                label: "Educação indígena",
                value: state.otherCoursesNativeEducation,
                onChanged: controller.setOtherCoursesNativeEducation,
              ),
              TagCheckbox(
                label: '''
Educação para as relações etnicorraciais 
e História e cultura Afro-Brasileira e Africana''',
                value: state.otherCoursesEthnicEducation,
                onChanged: controller.setOtherCoursesEthnicEducation,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              TagCheckbox(
                label: "Educação de jovens e adultos",
                value: state.otherCoursesEducationOfYouthAndAdults,
                onChanged: controller.setOtherCoursesEducationOfYouthAndAdults,
              ),
              TagCheckbox(
                label: "Educação do campo",
                value: state.otherCoursesFieldEducation,
                onChanged: controller.setOtherCoursesFieldEducation,
              ),
              TagCheckbox(
                label: "Educação ambiental",
                value: state.otherCoursesEnvironmentEducation,
                onChanged: controller.setOtherCoursesEnvironmentEducation,
              ),
              TagCheckbox(
                label: "Educação em direitos humanos",
                value: state.otherCoursesHumanRightsEducation,
                onChanged: controller.setOtherCoursesHumanRightsEducation,
              ),
              TagCheckbox(
                label: "Gênero e diversidade sexual",
                value: state.otherCoursesSexualEducation,
                onChanged: controller.setOtherCoursesSexualEducation,
              ),
              TagCheckbox(
                label: "Direitos de criança e adolescente",
                value: state.otherCoursesSexualEducation,
                onChanged: controller.setOtherCoursesSexualEducation,
              ),
              TagCheckbox(
                label: "Outros",
                value: state.otherCoursesOther,
                onChanged: controller.setOtherCoursesOther,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
