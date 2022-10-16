import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/enums/etapa_ensino_enum.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/enums/mediacao_enum.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/enums/modalidades_enum.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_states.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_update_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_update_events.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/left_list_checkbox_classroom_update_widget.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/widgets/right_list_checkbox_classroom_update_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class ClassroomBasicDataForm extends StatefulWidget {
  const ClassroomBasicDataForm({
    super.key,
    @required this.classroomEntity,
  });
  final ClassroomEntity? classroomEntity;
  @override
  _ClassroomBasicDataFormState createState() => _ClassroomBasicDataFormState();
}

class _ClassroomBasicDataFormState extends State<ClassroomBasicDataForm> {
  final controller = Modular.get<ClassroomUpdateDeleteBloc>();
  final _formKey = GlobalKey<FormState>();
  final _session = Modular.get<SessionBloc>();
  final mediacaoMap = Map.fromEntries(
    Mediacao.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );
  final etapaEnsinoMap = Map.fromEntries(
    EtapaEnsino.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );
  final modalidadesMap = Map.fromEntries(
    Modalidades.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  @override
  void initState() {
    _session.fetchCurrentSchool();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.classroomEntity != null) {
        controller.add(
          UpdateClassroom(
            edcensoStageVsModalityFk:
                widget.classroomEntity?.edcensoStageVsModalityFk ?? 'MA',
            name: widget.classroomEntity?.name ?? 'NoName',
            startTime:
                (widget.classroomEntity?.startTime ?? DateTime.now().toString())
                    .parseTimeOfDay,
            endTime:
                (widget.classroomEntity?.startTime ?? DateTime.now().toString())
                    .parseTimeOfDay,
            modalityId: widget.classroomEntity?.modalityId ?? 0,
            typePedagogicMeditationId:
                widget.classroomEntity?.typePedagogicMediationId ?? 0,
            stage: widget.classroomEntity?.stage ?? 'STAGE NOT DEFINED',
            id: widget.classroomEntity?.id ?? 'ID NOT DEFINED',
            schooling: widget.classroomEntity?.schooling ?? false,
            aee: widget.classroomEntity?.aee ?? false,
            aeeAccessibleTeaching:
                widget.classroomEntity?.aeeAccessibleTeaching ?? false,
            aeeAutonomousLife:
                widget.classroomEntity?.aeeAutonomousLife ?? false,
            aeeBraille: widget.classroomEntity?.aeeBraille ?? false,
            aeeCaa: widget.classroomEntity?.aeeCaa ?? false,
            aeeCognitiveFunction:
                widget.classroomEntity?.aeeCognitiveFunctions ?? false,
            aeeCurriculumEnrichment:
                widget.classroomEntity?.aeeCurriculumEnrichment ?? false,
            aeeLibras: widget.classroomEntity?.aeeLibras ?? false,
            aeeMobilityTechniques:
                widget.classroomEntity?.aeeMobilityTechniques ?? false,
            aeeOpticalNonoptical:
                widget.classroomEntity?.aeeOpticalNonOptical ?? false,
            aeePortuguese: widget.classroomEntity?.aeePortuguese ?? false,
            aeeSoroban: widget.classroomEntity?.aeeSoroban ?? false,
            complementaryActivity:
                widget.classroomEntity?.complementaryActivity ?? false,
            moreEducationParticipator:
                widget.classroomEntity?.moreEducationParticipator ?? false,
          ),
        );
      }
    });
    super.initState();
  }

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
            controller.setStartTime(
              value.parseTimeOfDay,
            );
          },
          value: startTime.format(context),
          validator: requiredTimeValidator,
        );

    Widget inputEndTime(TimeOfDay endTime) => TagTextField(
          label: "Horário Final",
          hint: "Somente números",
          formatters: [TagMasks.maskTime],
          onChanged: (String value) {
            controller.setEndTime(
              value.parseTimeOfDay,
            );
          },
          value: endTime.format(context),
          validator: requiredTimeValidator,
        );
    Widget selectModality(int modality) => TagDropdownField<int>(
          label: 'Modalidade de ensino',
          hint: "Selecione",
          items: modalidadesMap,
          onChanged: controller.setModality,
          value: modality,
          validator: requiredDropdownValidator<int?>(),
        );
    Widget selectStage(int edcensoStage) => TagDropdownField<int>(
          label: 'Etapa de Ensino',
          hint: "Selecione",
          items: etapaEnsinoMap,
          onChanged: controller.setStage,
          value: edcensoStage,
          validator: requiredDropdownValidator<int?>(),
        );

    Widget selectMediacaoDidaticaPedagogica(int mediacao) =>
        TagDropdownField<int>(
          label: 'Tipo de Mediação Didático-Pedagógica',
          hint: "Selecione",
          items: mediacaoMap,
          onChanged: controller.setMediacao,
          value: mediacao,
          validator: requiredDropdownValidator<int?>(),
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
                        child: withPadding(
                          inputName(state.name),
                        ),
                      ),
                      Flexible(
                        child: withPadding(
                          inputStartTime(state.startTime),
                        ),
                      ),
                    ]),
                    RowToColumn(children: [
                      Flexible(
                        child: withPadding(
                          selectModality(state.modalityId),
                        ),
                      ),
                      Flexible(
                        child: withPadding(
                          inputEndTime(state.endTime),
                        ),
                      ),
                    ]),
                    RowToColumn(children: [
                      Flexible(
                        child: withPadding(
                          selectStage(state.stageId),
                        ),
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
                            onChangedSchooling: (value) => controller.schooling(
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
                            onChangedAeeLibras: (value) => controller.aeeLibras(
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
                            SubmitUpdateClassroom(
                              schoolId: _session.state.currentSchool!.id!,
                              id: widget.classroomEntity!.id,
                            ),
                          ),
                        ),
                        TagButton(
                          text: "Excluir Turma",
                          onPressed: () => controller.add(
                            DeleteClassroom(
                              id: widget.classroomEntity!.id,
                            ),
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
        },
      ),
    );
  }
}
