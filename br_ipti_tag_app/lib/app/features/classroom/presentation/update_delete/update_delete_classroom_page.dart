import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/left_list_checkbox_classroom_update_widget.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/right_list_checkbox_classroom_update_widget.dart';
import 'package:br_ipti_tag_app/app/shared/util/util.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/components/shared/masks.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/classroom_states.dart';
import 'bloc/classroom_update_bloc.dart';
import 'bloc/classroom_update_events.dart';

class ClassroomBasicDataForm extends StatefulWidget {
  const ClassroomBasicDataForm({Key? key}) : super(key: key);

  @override
  _ClassroomBasicDataFormState createState() => _ClassroomBasicDataFormState();
}

class ClassroomUpdateDeletePage extends StatefulWidget {
  final String title;

  final String id;
  const ClassroomUpdateDeletePage({
    Key? key,
    this.title = 'Atualizar Turma',
    this.id = '',
  }) : super(key: key);

  @override
  ClassroomUpdateDeletePageState createState() =>
      ClassroomUpdateDeletePageState();
}

class ClassroomUpdateDeletePageState
    extends ModularState<ClassroomUpdateDeletePage, ClassroomUpdateDeleteBloc> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: TagDefaultPage(
        menu: const TagVerticalMenu(),
        aside: Container(),
        title: widget.title,
        description: "",
        path: ["Turmas", widget.title],
        body: <Widget>[
          TabBar(
            isScrollable: true,
            labelColor: TagColors.colorBaseProductDark,
            indicatorColor: TagColors.colorBaseProductDark,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            onTap: controller.tabNavigation,
            tabs: const [
              Tab(
                child: Text("Dados da Turma"),
              ),
              Tab(
                child: Text("Professor"),
              ),
              Tab(
                child: Text("Alunos"),
              ),
            ],
          ),
          const ClassroomBasicDataForm()
        ],
      ),
    );
  }

  @override
  void initState() {
    controller.add(StartEditing());
    super.initState();
  }
}

class _ClassroomBasicDataFormState extends State<ClassroomBasicDataForm> {
  final controller = Modular.get<ClassroomUpdateDeleteBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    const heading = Heading(text: "Dados Básicos", type: HeadingType.Title2);

    Widget inputName(String name) => TagTextField(
          label: "Nome",
          hint: "Nome Completo",
          onChanged: controller.setName,
          value: name,
          validator: requiredValidator,
        );

    Widget inputStartTime(TimeOfDay startTime) => TagTextField(
          label: "Horário Inicial",
          hint: "Somente números",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setStartTime(stringToTimeOfDay(value));
          },
          value: startTime.format(context),
          validator: requiredTimeValidator,
        );

    Widget inputEndTime(TimeOfDay endTime) => TagTextField(
          label: "Horário Final",
          hint: "Somente números",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setEndTime(stringToTimeOfDay(value));
          },
          value: endTime.format(context),
          validator: requiredTimeValidator,
        );
    Widget selectModality(int modality) => TagDropdownField(
          label: 'Modalidade de ensino',
          hint: "Selecione",
          items: controller.modalitiesList,
          onChanged: controller.setModality,
          value: modality,
          validator: requiredValidator,
        );
    Widget selectStage(int edcensoStage) => TagDropdownField(
          label: 'Etapa de Ensino',
          hint: "Selecione",
          items: controller.etapaEnsino,
          onChanged: controller.setStage,
          value: edcensoStage,
          validator: requiredValidator,
        );

    Widget selectMediacaoDidaticaPedagogica(int mediacao) => TagDropdownField(
          label: 'Tipo de Mediação Didático-Pedagógica',
          hint: "Selecione",
          items: controller.mediacao,
          onChanged: controller.setMediacao,
          value: mediacao,
          validator: requiredValidator,
        );

    return Form(
      key: _formKey,
      child: BlocBuilder<ClassroomUpdateDeleteBloc, ClassroomUpdateDeleteState>(
          bloc: controller,
          builder: (context, state) {
            if (state is ClassroomUpdateDeleteFormState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      withPadding(heading),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(inputName(state.name)),
                        ),
                        Flexible(
                          child: withPadding(inputStartTime(state.startTime)),
                        )
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(selectModality(state.modalityId)),
                        ),
                        Flexible(
                          child: withPadding(inputEndTime(state.endTime)),
                        )
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(selectStage(state.stageId)),
                        ),
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(
                            selectMediacaoDidaticaPedagogica(
                              state.typePedagogicMediationId,
                            ),
                          ),
                        ),
                      ]),
                      RowToColumn(children: [
                        Flexible(
                          child: withPadding(
                            LeftListClassroomUpdateWidget(
                              onChangedSchooling: (value) =>
                                  controller.schooling(
                                value: value!,
                              ),
                              onChangedAee: (value) => controller.aee(
                                value: value!,
                              ),
                              onChangedComplementaryActivity: (value) =>
                                  controller.complementaryActivity(
                                value: value!,
                              ),
                              onChangedMoreEducatorParticipator: (value) =>
                                  controller.moreEducationParticipator(
                                value: value!,
                              ),
                              state: state,
                            ),
                          ),
                        ),
                        Flexible(
                          child: withPadding(
                            RightListClassroomUpdateWidget(
                              onChangedAeeBraille: (value) =>
                                  controller.aeeBraille(
                                value: value!,
                              ),
                              onChangedAeeOpticalNonOptical: (value) =>
                                  controller.aeeOpticalNonOptical(
                                value: value!,
                              ),
                              state: state,
                              onChangedAeeCognitiveFunctions: (value) =>
                                  controller.aeeCognitiveFunctions(
                                value: value!,
                              ),
                              onChangedAeeMobilityTechniques: (value) =>
                                  controller.aeeMobilityTechniques(
                                value: value!,
                              ),
                              onChangedAeeLibras: (value) =>
                                  controller.aeeLibras(
                                value: value!,
                              ),
                              onChangedAeeCaa: (value) => controller.aeeCaa(
                                value: value!,
                              ),
                              onChangedAeeCurriculumEnrichment: (value) =>
                                  controller.aeeCurriculumEnrichment(
                                value: value!,
                              ),
                              onChangedAeeAccessibleTeaching: (value) =>
                                  controller.aeeAccessibleTeaching(
                                value: value!,
                              ),
                              onChangedAeePortuguese: (value) =>
                                  controller.aeePortuguese(
                                value: value!,
                              ),
                              onChangedAeeSoroban: (value) =>
                                  controller.aeeSoroban(
                                value: value!,
                              ),
                              onChangedAeeAutonomousLife: (value) =>
                                  controller.aeeAutonomousLife(
                                value: value!,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TagButton(
                            text: "Salvar Alterações",
                            onPressed: () => controller.add(
                              SubmitClassroom(),
                            ),
                          ),
                          TagButton(
                            text: "Excluir Turma",
                            onPressed: () => controller.add(
                              SubmitClassroom(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
