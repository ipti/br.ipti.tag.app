import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_classroom_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'classroom_create_events.dart';
import 'classroom_states.dart';

final _initialState = ClassroomCreateFormState(
  name: "",
  stageVsModalityFk: 'MN',
  startTime: TimeOfDay.now(),
  endTime: TimeOfDay.now(),
  modalityId: 0,
  stageId: 0,
  typePedagogicMediationId: 0,
  registerType: '1230',
);

class ClassroomCreateBloc
    extends Bloc<ClassroomCreateEvent, ClassroomCreateFormState> {
  ClassroomCreateBloc(this._usecaseCreateClassroom) : super(_initialState);

  final CreateClassroomUsecase _usecaseCreateClassroom;

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
  void aeeBraille({bool value = false}) => add(
        AeeBrailleChanged(
          aeeBraille: value,
        ),
      );
  void aeeOpticalNonOptical({bool value = false}) => add(
        AeeOpticalNonOpticalChanged(
          aeeOpticalNonOptical: value,
        ),
      );
  void aeeCognitiveFunctions({bool value = false}) => add(
        AeeCognitiveFunctionsChanged(
          aeeCognitiveFunctions: value,
        ),
      );
  void aeeMobilityTechniques({bool value = false}) => add(
        AeeMobilityTechniquesChanged(
          aeeMobilityTechniques: value,
        ),
      );
  void aeeLibras({bool value = false}) => add(
        AeeLibrasChanged(
          aeeLibras: value,
        ),
      );
  void aeeCaa({bool value = false}) => add(
        AeeCaaChanged(
          aeeCaa: value,
        ),
      );
  void aeeCurriculumEnrichment({bool value = false}) => add(
        AeeCurriculumEnrichmentChanged(
          aeeCurriculumEnrichment: value,
        ),
      );
  void aeeAccessibleTeaching({bool value = false}) => add(
        AeeAccessibleTeachingChanged(
          aeeAccessibleTeaching: value,
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
  void aeeAutonomousLife({bool value = false}) => add(
        AeeAutonomousLifeChanged(
          aeeAutonomousLife: value,
        ),
      );
  void aee({bool value = false}) => add(
        AeeChanged(
          aee: value,
        ),
      );
  void moreEducationParticipator({bool value = false}) => add(
        MoreEducationParticipatorChanged(
          moreEducationParticipator: value,
        ),
      );
  void complementaryActivity({bool value = false}) => add(
        ComplementaryActivityChanged(
          complementaryActivity: value,
        ),
      );
  void schooling({bool value = false}) => add(
        SchoolingChanged(
          schooling: value,
        ),
      );
  void setName(String name) => add(NameChanged(name));
  void setStartTime(TimeOfDay startTime) => add(StartTimeChanged(startTime));
  void setEndTime(TimeOfDay endTime) => add(EndTimeChanged(endTime));
  void setModality(int modalityId) => add(ModalityChanged(modalityId));
  void setStage(int stageId) => add(StageChanged(stageId));
  void setMediacao(int mediacao) => add(
        TypePedagogicalMediationChanged(
          mediacao,
        ),
      );

  @override
  Stream<ClassroomCreateFormState> mapEventToState(
    ClassroomCreateEvent event,
  ) async* {
    ClassroomCreateFormState newState = state;
    if (event is NameChanged) {
      newState = state.copyWith(name: event.name);
    } else if (event is StartTimeChanged) {
      newState = state.copyWith(startTime: event.startTime);
    } else if (event is EndTimeChanged) {
      newState = state.copyWith(endTime: event.endTime);
    } else if (event is ModalityChanged) {
      newState = state.copyWith(modalityId: event.modalityId);
    } else if (event is StageChanged) {
      newState = state.copyWith(
        stageVsModalityFk: _getEdcensoStage(event.idEdcenso),
      );
    } else if (event is TypePedagogicalMediationChanged) {
      newState = state.copyWith(
          typePedagogicMediationId: event.typePedagogicMediationId);
    } else if (event is SchoolingChanged) {
      newState = state.copyWith(
        schooling: event.schooling,
      );
    } else if (event is ComplementaryActivityChanged) {
      newState = state.copyWith(
        complementaryActivity: event.complementaryActivity,
      );
    } else if (event is AeeChanged) {
      newState = state.copyWith(
        aee: event.aee,
      );
    } else if (event is MoreEducationParticipatorChanged) {
      newState = state.copyWith(
        moreEducationParticipator: event.moreEducationParticipator,
      );
    } else if (event is AeeBrailleChanged) {
      newState = state.copyWith(
        aeeBraille: event.aeeBraille,
      );
    } else if (event is AeeOpticalNonOpticalChanged) {
      newState = state.copyWith(
        aeeOpticalNonOptical: event.aeeOpticalNonOptical,
      );
    } else if (event is AeeMobilityTechniquesChanged) {
      newState = state.copyWith(
        aeeMobilityTechniques: event.aeeMobilityTechniques,
      );
    } else if (event is AeeCognitiveFunctionsChanged) {
      newState =
          state.copyWith(aeeCognitiveFunctions: event.aeeCognitiveFunctions);
    } else if (event is AeeLibrasChanged) {
      newState = state.copyWith(aeeLibras: event.aeeLibras);
    } else if (event is AeeCaaChanged) {
      newState = state.copyWith(
        aeeCaa: event.aeeCaa,
      );
    } else if (event is AeeCurriculumEnrichmentChanged) {
      newState = state.copyWith(
        aeeCurriculumEnrichment: event.aeeCurriculumEnrichment,
      );
    } else if (event is AeeAccessibleTeachingChanged) {
      newState = state.copyWith(
        aeeAccessibleTeaching: event.aeeAccessibleTeaching,
      );
    } else if (event is AeePortugueseChanged) {
      newState = state.copyWith(
        aeePortuguese: event.aeePortuguese,
      );
    } else if (event is AeeSorobanChanged) {
      newState = state.copyWith(
        aeeSoroban: event.aeeSoroban,
      );
    } else if (event is AeeAutonomousLifeChanged) {
      newState = state.copyWith(
        aeeAutonomousLife: event.aeeAutonomousLife,
      );
    } else if (event is SubmitClassroom) {
      final params = ClassroomCreateEntity(
        schoolId: event.id,
        moreEducationParticipator: state.moreEducationParticipator,
        name: state.name,
        startTime: state.startTime,
        endTime: state.endTime,
        modalityId: state.modalityId,
        typePedagogicMediationId: state.typePedagogicMediationId,
        complementaryActivity: state.complementaryActivity,
        aeeCaa: state.aeeCaa,
        aeeAccessibleTeaching: state.aeeAccessibleTeaching,
        aee: state.aee,
        aeeAutonomousLife: state.aeeAutonomousLife,
        aeeBraille: state.aeeBraille,
        aeeCognitiveFunctions: state.aeeCognitiveFunctions,
        aeeCurriculumEnrichment: state.aeeCurriculumEnrichment,
        aeeLibras: state.aeeLibras,
        aeeMobilityTechniques: state.aeeMobilityTechniques,
        aeeOpticalNonOptical: state.aeeOpticalNonOptical,
        aeePortuguese: state.aeePortuguese,
        aeeSoroban: state.aeeSoroban,
        schooling: state.schooling,
        edcensoStageVsModalityFk: state.stageVsModalityFk,
        weekDaysFriday: state.weekDaysFriday,
        weekDaysMonday: state.weekDaysMonday,
        weekDaysSaturday: state.weekDaysSaturday,
        weekDaysSunday: state.weekDaysSunday,
        weekDaysThursday: state.weekDaysThursday,
        weekDaysTuesday: state.weekDaysTuesday,
        weekDaysWednesday: state.weekDaysWednesday,
      );

      _usecaseCreateClassroom.call(params);
    }

    yield newState;
  }

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
}
