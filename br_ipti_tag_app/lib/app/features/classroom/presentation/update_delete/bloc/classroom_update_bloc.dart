import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/delete_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/update_classroom_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'classroom_states.dart';
import 'classroom_update_events.dart';

final _initialState = ClassroomUpdateDeleteInitial();

class ClassroomUpdateDeleteBloc
    extends Bloc<ClassroomUpdateDeleteEvent, ClassroomUpdateDeleteState> {
  final UpdateClassroomUsecase _usecaseUpdateClassroom;
  final DeleteClassroomUsecase _usecaseDeleteClassroom;

  final modalitiesList = const <int, String>{
    0: "Ensino Regular",
    1: "Educação Especial",
    2: "Educação de Jovens e Adultos (EJA)",
  };

  final etapaEnsino = const <int, String>{
    0: "Manhã",
    1: "Tarde",
    2: "Noite",
  };

  final mediacao = const <int, String>{
    0: "Mediação 1",
    1: "Mediação 2",
    2: "Mediação 3",
  };

  ClassroomUpdateDeleteBloc(
    this._usecaseDeleteClassroom,
    this._usecaseUpdateClassroom,
  ) : super(_initialState);
  void aee({bool value = false}) => add(
        AeeChanged(
          aee: value,
        ),
      );
  void aeeAccessibleTeaching({bool value = false}) => add(
        AeeAccessibleTeachingChanged(
          aeeAccessibleTeaching: value,
        ),
      );
  void aeeAutonomousLife({bool value = false}) => add(
        AeeAutonomousLifeChanged(
          aeeAutonomousLife: value,
        ),
      );
  void aeeBraille({bool value = false}) => add(
        AeeBrailleChanged(
          aeeBraille: value,
        ),
      );
  void aeeCaa({bool value = false}) => add(
        AeeCaaChanged(
          aeeCaa: value,
        ),
      );
  void aeeCognitiveFunctions({bool value = false}) => add(
        AeeCognitiveFunctionsChanged(
          aeeCognitiveFunctions: value,
        ),
      );
  void aeeCurriculumEnrichment({bool value = false}) => add(
        AeeCurriculumEnrichmentChanged(
          aeeCurriculumEnrichment: value,
        ),
      );
  void aeeLibras({bool value = false}) => add(
        AeeLibrasChanged(
          aeeLibras: value,
        ),
      );
  void aeeMobilityTechniques({bool value = false}) => add(
        AeeMobilityTechniquesChanged(
          aeeMobilityTechniques: value,
        ),
      );
  void aeeOpticalNonOptical({bool value = false}) => add(
        AeeOpticalNonOpticalChanged(
          aeeOpticalNonOptical: value,
        ),
      );
  void aeePortuguese({bool value = false}) => add(
        AeePortugueseChanged(
          aeePortuguese: value,
        ),
      );
  void aeeSoroban({bool value = false}) => add(
        AeeSorobanChanged(
          aeeSoroban: value,
        ),
      );
  void complementaryActivity({bool value = false}) => add(
        ComplementaryActivityChanged(
          complementaryActivity: value,
        ),
      );
  @override
  Stream<ClassroomUpdateDeleteState> mapEventToState(
      ClassroomUpdateDeleteEvent event) async* {
    ClassroomUpdateDeleteState newState = state;
    if (event is NameChanged) {
      newState =
          (state as ClassroomUpdateDeleteFormState).copyWith(name: event.name);
    } else if (event is StartTimeChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(startTime: event.startTime);
    } else if (event is EndTimeChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(endTime: event.endTime);
    } else if (event is ModalityChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(modalityId: event.modalityId);
    } else if (event is StageChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        stageVsModalityFk: _getEdcensoStage(event.idEdcenso),
      );
    } else if (event is TypePedagogicalMediationChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(typePedagogicMediationId: event.typePedagogicMediationId);
    } else if (event is SchoolingChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        schooling: event.schooling,
      );
    } else if (event is ComplementaryActivityChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        complementaryActivity: event.complementaryActivity,
      );
    } else if (event is AeeChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aee: event.aee,
      );
    } else if (event is MoreEducationParticipatorChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        moreEducationParticipator: event.moreEducationParticipator,
      );
    } else if (event is AeeBrailleChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeBraille: event.aeeBraille,
      );
    } else if (event is AeeOpticalNonOpticalChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeOpticalNonOptical: event.aeeOpticalNonOptical,
      );
    } else if (event is AeeMobilityTechniquesChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeMobilityTechniques: event.aeeMobilityTechniques,
      );
    } else if (event is AeeCognitiveFunctionsChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(aeeCognitiveFunctions: event.aeeCognitiveFunctions);
    } else if (event is AeeLibrasChanged) {
      newState = (state as ClassroomUpdateDeleteFormState)
          .copyWith(aeeLibras: event.aeeLibras);
    } else if (event is AeeCaaChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeCaa: event.aeeCaa,
      );
    } else if (event is AeeCurriculumEnrichmentChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeCurriculumEnrichment: event.aeeCurriculumEnrichment,
      );
    } else if (event is AeeAccessibleTeachingChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeAccessibleTeaching: event.aeeAccessibleTeaching,
      );
    } else if (event is AeePortugueseChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeePortuguese: event.aeePortuguese,
      );
    } else if (event is AeeSorobanChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeSoroban: event.aeeSoroban,
      );
    } else if (event is AeeAutonomousLifeChanged) {
      newState = (state as ClassroomUpdateDeleteFormState).copyWith(
        aeeAutonomousLife: event.aeeAutonomousLife,
      );
    } else if (event is UpdateClassroom) {
      final params = ClassroomCreateEntity(
        moreEducationParticipator: event.moreEducationParticipator,
        name: event.name,
        startTime: event.startTime,
        endTime: event.endTime,
        modalityId: event.modalityId,
        typePedagogicMediationId: event.typePedagogicMeditationId,
        complementaryActivity: event.complementaryActivity,
        aeeCaa: event.aeeCaa,
        aeeAccessibleTeaching: event.aeeAccessibleTeaching,
        aee: event.aee,
        aeeAutonomousLife: event.aeeAutonomousLife,
        aeeBraille: event.aeeBraille,
        aeeCognitiveFunctions: event.aeeCognitiveFunction,
        aeeCurriculumEnrichment: event.aeeCurriculumEnrichment,
        aeeLibras: event.aeeLibras,
        aeeMobilityTechniques: event.aeeMobilityTechniques,
        aeeOpticalNonOptical: event.aeeOpticalNonoptical,
        aeePortuguese: event.aeePortuguese,
        aeeSoroban: event.aeeSoroban,
        schooling: event.schooling,
        edcensoStageVsModalityFk: event.stage,
      );
    } else if (event is SubmitUpdateClassroom) {
      final params = ClassroomCreateEntity(
        moreEducationParticipator:
            (state as ClassroomUpdateDeleteFormState).moreEducationParticipator,
        name: (state as ClassroomUpdateDeleteFormState).name,
        startTime: (state as ClassroomUpdateDeleteFormState).startTime,
        endTime: (state as ClassroomUpdateDeleteFormState).endTime,
        modalityId: (state as ClassroomUpdateDeleteFormState).modalityId,
        typePedagogicMediationId:
            (state as ClassroomUpdateDeleteFormState).typePedagogicMediationId,
        complementaryActivity:
            (state as ClassroomUpdateDeleteFormState).complementaryActivity,
        aeeCaa: (state as ClassroomUpdateDeleteFormState).aeeCaa,
        aeeAccessibleTeaching:
            (state as ClassroomUpdateDeleteFormState).aeeAccessibleTeaching,
        aee: (state as ClassroomUpdateDeleteFormState).aee,
        aeeAutonomousLife:
            (state as ClassroomUpdateDeleteFormState).aeeAutonomousLife,
        aeeBraille: (state as ClassroomUpdateDeleteFormState).aeeBraille,
        aeeCognitiveFunctions:
            (state as ClassroomUpdateDeleteFormState).aeeCognitiveFunctions,
        aeeCurriculumEnrichment:
            (state as ClassroomUpdateDeleteFormState).aeeCurriculumEnrichment,
        aeeLibras: (state as ClassroomUpdateDeleteFormState).aeeLibras,
        aeeMobilityTechniques:
            (state as ClassroomUpdateDeleteFormState).aeeMobilityTechniques,
        aeeOpticalNonOptical:
            (state as ClassroomUpdateDeleteFormState).aeeOpticalNonOptical,
        aeePortuguese: (state as ClassroomUpdateDeleteFormState).aeePortuguese,
        aeeSoroban: (state as ClassroomUpdateDeleteFormState).aeeSoroban,
        schooling: (state as ClassroomUpdateDeleteFormState).schooling,
        edcensoStageVsModalityFk:
            (state as ClassroomUpdateDeleteFormState).stageVsModalityFk,
        weekDaysFriday:
            (state as ClassroomUpdateDeleteFormState).weekDaysFriday,
        weekDaysMonday:
            (state as ClassroomUpdateDeleteFormState).weekDaysMonday,
        weekDaysSaturday:
            (state as ClassroomUpdateDeleteFormState).weekDaysSaturday,
        weekDaysSunday:
            (state as ClassroomUpdateDeleteFormState).weekDaysSunday,
        weekDaysThursday:
            (state as ClassroomUpdateDeleteFormState).weekDaysThursday,
        weekDaysTuesday:
            (state as ClassroomUpdateDeleteFormState).weekDaysTuesday,
        weekDaysWednesday:
            (state as ClassroomUpdateDeleteFormState).weekDaysWednesday,
      );
      _usecaseUpdateClassroom.call(
        Params(
          event.id,
          params,
        ),
      );
    } else if (event is DeleteClassroom) {
      _usecaseDeleteClassroom.call(
        event.id,
      );
    }

    yield newState;
  }

  void moreEducationParticipator({bool value = false}) => add(
        MoreEducationParticipatorChanged(
          moreEducationParticipator: value,
        ),
      );
  void schooling({bool value = false}) => add(
        SchoolingChanged(
          schooling: value,
        ),
      );
  void setEndTime(TimeOfDay endTime) => add(EndTimeChanged(endTime));
  void setMediacao(int mediacao) => add(
        TypePedagogicalMediationChanged(
          mediacao,
        ),
      );
  void setModality(int modalityId) => add(ModalityChanged(modalityId));
  void setName(String name) => add(NameChanged(name));
  void setStage(int stageId) => add(StageChanged(stageId));

  void setStartTime(TimeOfDay startTime) => add(StartTimeChanged(startTime));

  String _getEdcensoStage(int idEdcenso) {
    switch (idEdcenso) {
      case 0:
        return "MA";
      case 1:
        return "TD";
      default:
        return "NT";
    }
  }

  int value = 0;

  void tabNavigation(int index) {
    switch (index) {
      case 0:
        value = 0;
        break;
      case 1:
        value = 1;
        break;
      default:
        value = 2;
    }
  }
}
