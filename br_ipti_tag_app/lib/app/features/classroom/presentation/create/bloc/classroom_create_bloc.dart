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
  ClassroomCreateBloc(this._usecaseCreateClassroom) : super(_initialState) {
    on<StartEditing>((event, emit) {});
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<StartTimeChanged>((event, emit) {
      emit(state.copyWith(startTime: event.startTime));
    });
    on<EndTimeChanged>((event, emit) {
      emit(state.copyWith(endTime: event.endTime));
    });
    on<ModalityChanged>((event, emit) {
      emit(state.copyWith(modalityId: event.modalityId));
    });
    on<StageChanged>((event, emit) {
      emit(state.copyWith(
        stageVsModalityFk: _getEdcensoStage(event.idEdcenso),
      ));
    });
    on<TypePedagogicalMediationChanged>((event, emit) {
      emit(state.copyWith(
          typePedagogicMediationId: event.typePedagogicMediationId));
    });
    on<SchoolingChanged>((event, emit) {
      emit(state.copyWith(
        schooling: event.schooling,
      ));
    });
    on<ComplementaryActivityChanged>((event, emit) {
      emit(state.copyWith(
        complementaryActivity: event.complementaryActivity,
      ));
    });
    on<AeeChanged>((event, emit) {
      emit(state.copyWith(
        aee: event.aee,
      ));
    });
    on<MoreEducationParticipatorChanged>((event, emit) {
      emit(state.copyWith(
        moreEducationParticipator: event.moreEducationParticipator,
      ));
    });
    on<AeeBrailleChanged>((event, emit) {
      emit(state.copyWith(
        aeeBraille: event.aeeBraille,
      ));
    });
    on<AeeOpticalNonOpticalChanged>((event, emit) {
      emit(state.copyWith(
        aeeOpticalNonOptical: event.aeeOpticalNonOptical,
      ));
    });
    on<AeeMobilityTechniquesChanged>((event, emit) {
      emit(state.copyWith(
        aeeMobilityTechniques: event.aeeMobilityTechniques,
      ));
    });
    on<AeeCognitiveFunctionsChanged>((event, emit) {
      emit(state.copyWith(aeeCognitiveFunctions: event.aeeCognitiveFunctions));
    });
    on<AeeLibrasChanged>((event, emit) {
      emit(state.copyWith(aeeLibras: event.aeeLibras));
    });
    on<AeeCaaChanged>((event, emit) {
      emit(state.copyWith(
        aeeCaa: event.aeeCaa,
      ));
    });
    on<AeeCurriculumEnrichmentChanged>((event, emit) {
      emit(state.copyWith(
        aeeCurriculumEnrichment: event.aeeCurriculumEnrichment,
      ));
    });
    on<AeeAccessibleTeachingChanged>((event, emit) {
      emit(state.copyWith(
        aeeAccessibleTeaching: event.aeeAccessibleTeaching,
      ));
    });
    on<AeePortugueseChanged>((event, emit) {
      emit(state.copyWith(
        aeePortuguese: event.aeePortuguese,
      ));
    });
    on<AeeSorobanChanged>((event, emit) {
      emit(state.copyWith(
        aeeSoroban: event.aeeSoroban,
      ));
    });
    on<AeeAutonomousLifeChanged>((event, emit) {
      emit(state.copyWith(
        aeeAutonomousLife: event.aeeAutonomousLife,
      ));
    });
    on<SubmitClassroom>((event, emit) {
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
    });
  }

  final CreateClassroomUsecase _usecaseCreateClassroom;
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
  void setModality(int? modalityId) => add(ModalityChanged(modalityId!));
  void setStage(int? stageId) => add(StageChanged(stageId!));
  void setMediacao(int? mediacao) => add(
        TypePedagogicalMediationChanged(
          mediacao!,
        ),
      );

  String _getEdcensoStage(int? idEdcenso) {
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
