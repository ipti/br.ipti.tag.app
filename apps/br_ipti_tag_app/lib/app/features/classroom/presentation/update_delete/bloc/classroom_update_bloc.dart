import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../domain/usecases/delete_classroom_usecase.dart';
import '../../../domain/usecases/update_classroom_usecase.dart';
import 'classroom_states.dart';
import 'classroom_update_events.dart';

final _initialState = ClassroomUpdateDeleteInitial();

class ClassroomUpdateDeleteBloc
    extends Bloc<ClassroomUpdateDeleteEvent, ClassroomUpdateDeleteState> {
  final UpdateClassroomUsecase _usecaseUpdateClassroom;
  final DeleteClassroomUsecase _usecaseDeleteClassroom;

  ClassroomUpdateDeleteBloc(
    this._usecaseDeleteClassroom,
    this._usecaseUpdateClassroom,
  ) : super(_initialState) {
    on<NameChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState).copyWith(name: event.name),
        ));
    on<StartTimeChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState)
              .copyWith(startTime: event.startTime),
        ));
    on<EndTimeChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState)
              .copyWith(endTime: event.endTime),
        ));
    on<ModalityChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState)
              .copyWith(modalityId: event.modalityId),
        ));
    on<StageChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          stageVsModalityFk: event.idEdcenso.toString(),
        )));
    on<TypePedagogicalMediationChanged>((event, emit) => emit((state
            as ClassroomUpdateDeleteFormState)
        .copyWith(typePedagogicMediationId: event.typePedagogicMediationId)));
    on<SchoolingChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          schooling: event.schooling,
        )));
    on<ComplementaryActivityChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          complementaryActivity: event.complementaryActivity,
        )));
    on<AeeChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aee: event.aee,
        )));
    on<MoreEducationParticipatorChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          moreEducationParticipator: event.moreEducationParticipator,
        )));
    on<AeeBrailleChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeBraille: event.aeeBraille,
        )));
    on<AeeOpticalNonOpticalChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeOpticalNonOptical: event.aeeOpticalNonOptical,
        )));
    on<AeeMobilityTechniquesChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeMobilityTechniques: event.aeeMobilityTechniques,
        )));
    on<AeeCognitiveFunctionsChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState)
              .copyWith(aeeCognitiveFunctions: event.aeeCognitiveFunctions),
        ));
    on<AeeLibrasChanged>((event, emit) => emit(
          (state as ClassroomUpdateDeleteFormState)
              .copyWith(aeeLibras: event.aeeLibras),
        ));
    on<AeeCaaChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeCaa: event.aeeCaa,
        )));
    on<AeeCurriculumEnrichmentChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeCurriculumEnrichment: event.aeeCurriculumEnrichment,
        )));
    on<AeeAccessibleTeachingChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeAccessibleTeaching: event.aeeAccessibleTeaching,
        )));
    on<AeePortugueseChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeePortuguese: event.aeePortuguese,
        )));
    on<AeeSorobanChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeSoroban: event.aeeSoroban,
        )));
    on<AeeAutonomousLifeChanged>((event, emit) =>
        emit((state as ClassroomUpdateDeleteFormState).copyWith(
          aeeAutonomousLife: event.aeeAutonomousLife,
        )));
    on<UpdateClassroom>((event, emit) => emit(ClassroomUpdateDeleteFormState(
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
          registerType: '20',
          stageId: 1,
          stageVsModalityFk: '1',
        )));
    on<SubmitUpdateClassroom>((event, emit) {
      final params = ClassroomCreateEntity(
        schoolId: event.schoolId,
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
        UpdateClassroomParams(
          event.id,
          params,
        ),
      );
    });
    on<DeleteClassroom>((event, emit) => _usecaseDeleteClassroom.call(
          event.id,
        ));
  }

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
  void setEndTime(DateTime endTime) => add(
        EndTimeChanged(endTime),
      );
  void setMediacao(int? mediacao) => add(
        TypePedagogicalMediationChanged(
          mediacao!,
        ),
      );
  void setModality(int? modalityId) => add(
        ModalityChanged(modalityId!),
      );
  void setName(String name) => add(
        NameChanged(name),
      );
  void setStage(int? stageId) => add(
        StageChanged(stageId!),
      );

  void setStartTime(DateTime startTime) => add(
        StartTimeChanged(startTime),
      );

  // String _getEdcensoStage(int idEdcenso) {
  //   switch (idEdcenso) {
  //     case 0:
  //       return "MA";
  //     case 1:
  //       return "TD";
  //     default:
  //       return "NT";
  //   }
  // }

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
