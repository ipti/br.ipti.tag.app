import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_classroom_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classroom_create_events.dart';
import 'classroom_states.dart';

final _initialState = ClassroomCreateFormState(
  name: "",
  stageVsModalityFk: '',
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
      ClassroomCreateEvent event) async* {
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
    } else if (event is SubmitClassroom) {
      final params = ClassroomCreateEntity(
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
