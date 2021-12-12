import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class PostClasroomEndPoint extends EndPointAPI {
  PostClasroomEndPoint(this.params);

  PostClassroomParams params;

  @override
  String get path => '/classroom';

  @override
  Parameters? get bodyParameters => () => {
        "register_type": params.registerType,
        "inep_id": params.inepId,
        "name": params.name,
        "school_fk": {},
        "pedagogical_mediation_type": params.pedagogicalMeditationType,
        "initial_hour": params.initialHour,
        "initial_minute": params.initialMinute,
        "final_hour": params.finalHour,
        "final_minute": params.finalMinute,
        "week_days_sunday": params.weekDaySunday,
        "week_days_monday": params.weekDayMonday,
        "week_days_tuesday": params.weekDayTuesday,
        "week_days_wednesday": params.weekDayWednesday,
        "week_days_thursday": params.weekDayThursday,
        "week_days_friday": params.weekDayFriday,
        "week_days_saturday": params.weekDaySaturday,
        "schooling": params.schooling,
        "complementary_activity": params.complementaryActivity,
        "aee": params.aee,
        "assistance_type": params.assistanceType,
        "mais_educacao_participator": params.maisEducacaoParticipator,
        "complementary_activity_type_1": params.complementaryActivityType1,
        "complementary_activity_type_2": params.complementaryActivityType2,
        "complementary_activity_type_3": params.complementaryActivityType3,
        "complementary_activity_type_4": params.complementaryActivityType4,
        "complementary_activity_type_5": params.complementaryActivityType5,
        "complementary_activity_type_6": params.complementaryActivityType6,
        "diff_location": params.diffLocation,
        "aee_braille": params.aeeBraille,
        "aee_optical_nonoptical": params.aeeOpticalNonoptical,
        "aee_cognitive_functions": params.aeeCognitiveFunction,
        "aee_mobility_techniques": params.aeeMobilityTechniques,
        "aee_libras": params.aeeLibras,
        "aee_caa": params.aeeCaa,
        "aee_curriculum_enrichment": params.aeeCurriculumEnrichment,
        "aee_soroban": params.aeeSoroban,
        "aee_accessible_teaching": params.aeeAccessibleTeaching,
        "aee_portuguese": params.aeePortuguese,
        "aee_autonomous_life": params.aeeAutonomousLife,
        "modality": params.modality,
        "edcenso_stage_vs_modality_fk": params.edcensoStageVsModalityFk,
        "course": params.course,
        "discipline_chemistry": params.disciplineChemistry,
        "discipline_physics": params.disciplinePhysics,
        "discipline_mathematics": params.disciplineMathematics,
        "discipline_biology": params.disciplineBiology,
        "discipline_science": params.disciplineScience,
        "discipline_language_portuguese_literature":
            params.disciplineLanguagePortugueseLiterature,
        "discipline_foreign_language_english":
            params.disciplineForeignLanguageEnglish,
        "discipline_foreign_language_spanish":
            params.disciplineForeignLanguageSpanish,
        "discipline_foreign_language_franch":
            params.disciplineForeignLanguageFranch,
        "discipline_foreign_language_other":
            params.disciplineForeignLanguageOther,
        "discipline_arts": params.disciplineArts,
        "discipline_physical_education": params.disciplinePhysicalEducation,
        "discipline_history": params.disciplineHistory,
        "discipline_geography": params.disciplineGeography,
        "discipline_philosophy": params.disciplinePhilosophy,
        "discipline_social_study": params.disciplineSocialStudy,
        "discipline_sociology": params.disciplineSociology,
        "discipline_protuguese_secondary_language":
            params.disciplinePortugueseSecondaryLanguage,
        "discipline_curricular_stage": params.disciplineCurricularStage,
        "discipline_informatics": params.disciplineInformatics,
        "discipline_professional_disciplines":
            params.disciplineProfessionalDisciplines,
        "discipline_special_education_and_inclusive_practices":
            params.disciplineSpecialEducationAndInclusivePractives,
        "discipline_sociocultural_diversity":
            params.disciplineSocioculturalDiversity,
        "discipline_libras": params.disciplineLibras,
        "discipline_pedagogical": params.disciplinePedagogical,
        "discipline_religious": params.disciplineReligious,
        "discipline_native_language": params.disciplineNativeLanguage,
        "discipline_others": params.disciplineOthers,
        "school_year": params.schoolYear,
        "turn": params.turn,
        "hash": params.hash,
        "edcenso_professional_education_course_fk": {},
        "calendar_fk": {},
      };

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}

class PostClassroomParams {
  const PostClassroomParams({
    required this.disciplineForeignLanguageEnglish,
    required this.edcensoStageVsModalityFk,
    required this.initialHour,
    required this.initialMinute,
    required this.finalHour,
    required this.finalMinute,
    required this.weekDaySunday,
    required this.weekDayMonday,
    required this.weekDayTuesday,
    required this.weekDayWednesday,
    required this.weekDayThursday,
    required this.weekDayFriday,
    required this.weekDaySaturday,
    required this.registerType,
    required this.inepId,
    required this.name,
    required this.course,
    required this.pedagogicalMeditationType,
    required this.schooling,
    required this.complementaryActivity,
    required this.aee,
    required this.assistanceType,
    required this.maisEducacaoParticipator,
    required this.complementaryActivityType1,
    required this.complementaryActivityType2,
    required this.complementaryActivityType3,
    required this.complementaryActivityType4,
    required this.complementaryActivityType5,
    required this.complementaryActivityType6,
    required this.diffLocation,
    required this.aeeBraille,
    required this.aeeOpticalNonoptical,
    required this.aeeCognitiveFunction,
    required this.aeeMobilityTechniques,
    required this.aeeLibras,
    required this.aeeCaa,
    required this.aeeCurriculumEnrichment,
    required this.aeeSoroban,
    required this.aeeAccessibleTeaching,
    required this.aeePortuguese,
    required this.aeeAutonomousLife,
    required this.modality,
    required this.disciplineChemistry,
    required this.disciplinePhysics,
    required this.disciplineMathematics,
    required this.disciplineBiology,
    required this.disciplineScience,
    required this.disciplineLanguagePortugueseLiterature,
    required this.disciplineForeignLanguageSpanish,
    required this.disciplineForeignLanguageFranch,
    required this.disciplineForeignLanguageOther,
    required this.disciplineArts,
    required this.disciplinePhysicalEducation,
    required this.disciplineHistory,
    required this.disciplineGeography,
    required this.disciplinePhilosophy,
    required this.disciplineSocialStudy,
    required this.disciplineSociology,
    required this.disciplinePortugueseSecondaryLanguage,
    required this.disciplineCurricularStage,
    required this.disciplineInformatics,
    required this.disciplineProfessionalDisciplines,
    required this.disciplineSpecialEducationAndInclusivePractives,
    required this.disciplineSocioculturalDiversity,
    required this.disciplineLibras,
    required this.disciplinePedagogical,
    required this.disciplineReligious,
    required this.disciplineNativeLanguage,
    required this.disciplineOthers,
    required this.schoolYear,
    required this.turn,
    required this.hash,
  });
  final String registerType;
  final String inepId;
  final String name;
  final int pedagogicalMeditationType;
  final String initialHour;
  final String initialMinute;
  final String finalHour;
  final String finalMinute;
  final bool weekDaySunday;
  final bool weekDayMonday;
  final bool weekDayTuesday;
  final bool weekDayWednesday;
  final bool weekDayThursday;
  final bool weekDayFriday;
  final bool weekDaySaturday;
  final bool schooling;
  final bool complementaryActivity;
  final bool aee;
  final int assistanceType;
  final bool maisEducacaoParticipator;
  final int complementaryActivityType1;
  final int complementaryActivityType2;
  final int complementaryActivityType3;
  final int complementaryActivityType4;
  final int complementaryActivityType5;
  final int complementaryActivityType6;
  final int diffLocation;
  final bool aeeBraille;
  final bool aeeOpticalNonoptical;
  final bool aeeCognitiveFunction;
  final bool aeeMobilityTechniques;
  final bool aeeLibras;
  final bool aeeCaa;
  final bool aeeCurriculumEnrichment;
  final bool aeeSoroban;
  final bool aeeAccessibleTeaching;
  final bool aeePortuguese;
  final bool aeeAutonomousLife;
  final int modality;
  final String edcensoStageVsModalityFk;
  final int course;
  final bool disciplineChemistry;
  final bool disciplinePhysics;
  final bool disciplineMathematics;
  final bool disciplineBiology;
  final bool disciplineScience;
  final bool disciplineLanguagePortugueseLiterature;
  final bool disciplineForeignLanguageEnglish;
  final bool disciplineForeignLanguageSpanish;
  final bool disciplineForeignLanguageFranch;
  final bool disciplineForeignLanguageOther;
  final bool disciplineArts;
  final bool disciplinePhysicalEducation;
  final bool disciplineHistory;
  final bool disciplineGeography;
  final bool disciplinePhilosophy;
  final bool disciplineSocialStudy;
  final bool disciplineSociology;
  final bool disciplinePortugueseSecondaryLanguage;
  final bool disciplineCurricularStage;
  final bool disciplineInformatics;
  final bool disciplineProfessionalDisciplines;
  final bool disciplineSpecialEducationAndInclusivePractives;
  final bool disciplineSocioculturalDiversity;
  final bool disciplineLibras;
  final bool disciplinePedagogical;
  final bool disciplineReligious;
  final bool disciplineNativeLanguage;
  final bool disciplineOthers;
  final int schoolYear;
  final String turn;
  final int hash;
}
