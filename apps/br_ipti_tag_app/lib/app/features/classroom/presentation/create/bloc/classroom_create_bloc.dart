import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';
import '../../../domain/usecases/create_classroom_usecase.dart';
import 'classroom_create_events.dart';
import 'classroom_states.dart';

final _initialState = ClassroomCreateFormState(
  name: "",
  stageVsModalityFk: "1",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  modalityId: 0,
  stageId: 0,
  typePedagogicMediationId: 0,
  registerType: '1230',
);

class ClassroomCreateBloc extends Bloc<ClassroomCreateEvent, ClassroomCreateFormState> {
  ClassroomCreateBloc(this._usecaseCreateClassroom) : super(_initialState) {
    on<StartEditing>((event, emit) => log("Start creating a new Classroom"));
    on<NameChanged>((event, emit) => emit(state.copyWith(name: event.name)));
    on<StartTimeChanged>((event, emit) => emit(state.copyWith(startTime: event.startTime)));
    on<EndTimeChanged>((event, emit) => emit(state.copyWith(endTime: event.endTime)));
    on<ModalityChanged>((event, emit) => emit(state.copyWith(modalityId: event.modalityId)));
    // on<StageChanged>((event, emit) => emit(state.copyWith(stageVsModalityFk: _getEdcensoStage(event.idEdcenso))));
    on<TypePedagogicalMediationChanged>((event, emit) => emit(state.copyWith(typePedagogicMediationId: event.typePedagogicMediationId)));
    on<SchoolingChanged>((event, emit) => emit(state.copyWith(schooling: event.schooling)));
    on<ComplementaryActivityChanged>((event, emit) => emit(state.copyWith(complementaryActivity: event.complementaryActivity)));
    on<AeeChanged>((event, emit) => emit(state.copyWith(aee: event.aee)));
    on<MoreEducationParticipatorChanged>((event, emit) => emit(state.copyWith(moreEducationParticipator: event.moreEducationParticipator)));
    on<AeeBrailleChanged>((event, emit) => emit(state.copyWith(aeeBraille: event.aeeBraille)));
    on<AeeOpticalNonOpticalChanged>((event, emit) => emit(state.copyWith(aeeOpticalNonOptical: event.aeeOpticalNonOptical)));
    on<AeeMobilityTechniquesChanged>((event, emit) => emit(state.copyWith(aeeMobilityTechniques: event.aeeMobilityTechniques)));
    on<AeeCognitiveFunctionsChanged>((event, emit) => emit(state.copyWith(aeeCognitiveFunctions: event.aeeCognitiveFunctions)));
    on<AeeLibrasChanged>((event, emit) => emit(state.copyWith(aeeLibras: event.aeeLibras)));
    on<AeeCaaChanged>((event, emit) => emit(state.copyWith(aeeCaa: event.aeeCaa)));
    on<AeeCurriculumEnrichmentChanged>((event, emit) => emit(state.copyWith(aeeCurriculumEnrichment: event.aeeCurriculumEnrichment)));
    on<AeeAccessibleTeachingChanged>((event, emit) => emit(state.copyWith(aeeAccessibleTeaching: event.aeeAccessibleTeaching)));
    on<AeePortugueseChanged>((event, emit) => emit(state.copyWith(aeePortuguese: event.aeePortuguese)));
    on<AeeSorobanChanged>((event, emit) => emit(state.copyWith(aeeSoroban: event.aeeSoroban)));
    on<AeeAutonomousLifeChanged>((event, emit) => emit(state.copyWith(aeeAutonomousLife: event.aeeAutonomousLife)));
    on<SubmitClassroom>((event, emit) {
      final classroomCreate = ClassroomModel(
        registerType: state.registerType,
        schoolInepFk: event.schoolId,
        name: state.name,
        initialHour: state.startTime.hour.toString(),
        initialMinute: state.startTime.minute.toString(),
        finalHour: state.endTime.hour.toString(),
        finalMinute: state.endTime.minute.toString(),
        weekDaysSunday: state.weekDaysSunday,
        weekDaysMonday: state.weekDaysMonday,
        weekDaysTuesday: state.weekDaysTuesday,
        weekDaysWednesday: state.weekDaysWednesday,
        weekDaysThursday: state.weekDaysThursday,
        weekDaysFriday: state.weekDaysFriday,
        weekDaysSaturday: state.weekDaysSaturday,
        complementaryActivity: state.complementaryActivity,
        aee: state.aee,
        // assistanceType: state.assistanceType,
        maisEducacaoParticipator: state.moreEducationParticipator,
        complementaryActivityType1: state.complementaryActivity,
        complementaryActivityType2: state.complementaryActivity,
        complementaryActivityType3: state.complementaryActivity,
        complementaryActivityType4: state.complementaryActivity,
        complementaryActivityType5: state.complementaryActivity,
        complementaryActivityType6: state.complementaryActivity,
        aeeBraille: state.aeeBraille,
        aeeOpticalNonoptical: state.aeeOpticalNonOptical,
        aeeCognitiveFunctions: state.aeeCognitiveFunctions,
        aeeMobilityTechniques: state.aeeMobilityTechniques,
        aeeLibras: state.aeeLibras,
        aeeCaa: state.aeeCaa,
        aeeCurriculumEnrichment: state.aeeCurriculumEnrichment,
        aeeSoroban: state.aeeSoroban,
        aeeAccessibleTeaching: state.aeeAccessibleTeaching,
        aeePortuguese: state.aeePortuguese,
        aeeAutonomousLife: state.aeeAutonomousLife,
        modality: state.modalityId,
        edcensoStageVsModalityFk: state.stageVsModalityFk,
        // edcensoProfessionalEducationCourseFk: state.edcensoProfessionalEducationCourseFk,
        // disciplineChemistry: state.disciplineChemistry,
        // disciplinePhysics: state.disciplinePhysics,
        // disciplineMathematics: state.disciplineMathematics,
        // disciplineBiology: state.disciplineBiology,
        // disciplineScience: state.disciplineScience,
        // disciplineLanguagePortugueseLiterature: state.disciplineLanguagePortugueseLiterature,
        // disciplineForeignLanguageEnglish: state.disciplineForeignLanguageEnglish,
        // disciplineForeignLanguageSpanish: disciplineForeignLanguageSpanish,
        // disciplineForeignLanguageFrench: disciplineForeignLanguageFrench,
        // disciplineForeignLanguageOther: disciplineForeignLanguageOther,
        // disciplineArts: disciplineArts,
        // disciplinePhysicalEducation: disciplinePhysicalEducation,
        // disciplineHistory: disciplineHistory,
        // disciplineGeography: disciplineGeography,
        // disciplinePhilosophy: disciplinePhilosophy,
        // disciplineSocialStudy: disciplineSocialStudy,
        // disciplineSociology: disciplineSociology,
        // disciplinePortugueseSecondaryLanguage: disciplinePortugueseSecondaryLanguage,
        // disciplineCurricularStage: disciplineCurricularStage,
        // disciplineInformatics: disciplineInformatics,
        // disciplineProfessionalDisciplines: disciplineProfessionalDisciplines,
        // disciplineSpecialEducationAndInclusivePractices: disciplineSpecialEducationAndInclusivePractices,
        // disciplineSocioculturalDiversity: disciplineSocioculturalDiversity,
        disciplineLibras: state.aeeBraille,
        // disciplinePedagogical: disciplinePedagogical,
        // disciplineReligious: disciplineReligious,
        disciplineNativeLanguage: state.aeePortuguese,
        // disciplineOthers: disciplineOthers,
        schoolYear: state.schoolYear,
        // turn: state.turn,
        createDate: DateTime.now(),
        // hash: hash,
        // calendarFk: calendarFk,
        schooling: state.schooling,
        // diffLocation: state.diffLocation,
        // course: state.course,
        // vacancy: state.vacancy,
      );

      final params = ClassroomCreateEntity(
        schoolId: event.schoolId,
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

  void setName(String name) => add(
        NameChanged(name),
      );

  void setStartTime(DateTime startTime) => add(
        StartTimeChanged(startTime),
      );

  void setEndTime(DateTime endTime) => add(
        EndTimeChanged(endTime),
      );

  void setModality(int? modalityId) => add(
        ModalityChanged(modalityId!),
      );

  void setStage(int? stageId) => add(
        StageChanged(stageId!),
      );

  void setMediacao(int? mediacao) => add(
        TypePedagogicalMediationChanged(
          mediacao!,
        ),
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
}
