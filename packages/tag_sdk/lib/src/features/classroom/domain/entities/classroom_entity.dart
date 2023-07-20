class ClassroomEntity {
  ClassroomEntity({
    this.registerType,
    this.schoolInepFk,
    required this.id,
    required this.name,
    this.initialHour,
    this.initialMinute,
    this.finalHour,
    this.finalMinute,
    this.weekDaysSunday,
    this.weekDaysMonday,
    this.weekDaysTuesday,
    this.weekDaysWednesday,
    this.weekDaysThursday,
    this.weekDaysFriday,
    this.weekDaysSaturday,
    this.complementaryActivity,
    this.aee,
    this.assistanceType,
    this.maisEducacaoParticipator,
    this.complementaryActivityType1,
    this.complementaryActivityType2,
    this.complementaryActivityType3,
    this.complementaryActivityType4,
    this.complementaryActivityType5,
    this.complementaryActivityType6,
    this.aeeBraille,
    this.aeeOpticalNonoptical,
    this.aeeCognitiveFunctions,
    this.aeeMobilityTechniques,
    this.aeeLibras,
    this.aeeCaa,
    this.aeeCurriculumEnrichment,
    this.aeeSoroban,
    this.aeeAccessibleTeaching,
    this.aeePortuguese,
    this.aeeAutonomousLife,
    required this.modality,
    this.edcensoStageVsModalityFk,
    this.edcensoProfessionalEducationCourseFk,
    this.disciplineChemistry,
    this.disciplinePhysics,
    this.disciplineMathematics,
    this.disciplineBiology,
    this.disciplineScience,
    this.disciplineLanguagePortugueseLiterature,
    this.disciplineForeignLanguageEnglish,
    this.disciplineForeignLanguageSpanish,
    this.disciplineForeignLanguageFrench,
    this.disciplineForeignLanguageOther,
    this.disciplineArts,
    this.disciplinePhysicalEducation,
    this.disciplineHistory,
    this.disciplineGeography,
    this.disciplinePhilosophy,
    this.disciplineSocialStudy,
    this.disciplineSociology,
    this.disciplinePortugueseSecondaryLanguage,
    this.disciplineCurricularStage,
    this.disciplineInformatics,
    this.disciplineProfessionalDisciplines,
    this.disciplineSpecialEducationAndInclusivePractices,
    this.disciplineSocioculturalDiversity,
    this.disciplineLibras,
    this.disciplinePedagogical,
    this.disciplineReligious,
    this.disciplineNativeLanguage,
    this.disciplineOthers,
    this.schoolYear,
    this.turn,
    this.createDate,
    this.hash,
    this.calendarFk,
    this.schooling,
    this.diffLocation,
    this.course,
    this.vacancy,
  });

  String? registerType;
  String? schoolInepFk;
  final int id;
  String name;
  String? initialHour;
  String? initialMinute;
  String? finalHour;
  String? finalMinute;
  bool? weekDaysSunday;
  bool? weekDaysMonday;
  bool? weekDaysTuesday;
  bool? weekDaysWednesday;
  bool? weekDaysThursday;
  bool? weekDaysFriday;
  bool? weekDaysSaturday;
  bool? complementaryActivity;
  bool? aee;
  int? assistanceType;
  bool? maisEducacaoParticipator;
  String? complementaryActivityType1;
  String? complementaryActivityType2;
  String? complementaryActivityType3;
  String? complementaryActivityType4;
  String? complementaryActivityType5;
  String? complementaryActivityType6;
  bool? aeeBraille;
  bool? aeeOpticalNonoptical;
  bool? aeeCognitiveFunctions;
  bool? aeeMobilityTechniques;
  bool? aeeLibras;
  bool? aeeCaa;
  bool? aeeCurriculumEnrichment;
  bool? aeeSoroban;
  bool? aeeAccessibleTeaching;
  bool? aeePortuguese;
  bool? aeeAutonomousLife;
  final int modality;
  String? edcensoStageVsModalityFk;
  String? edcensoProfessionalEducationCourseFk;
  int? disciplineChemistry;
  int? disciplinePhysics;
  int? disciplineMathematics;
  int? disciplineBiology;
  int? disciplineScience;
  int? disciplineLanguagePortugueseLiterature;
  int? disciplineForeignLanguageEnglish;
  int? disciplineForeignLanguageSpanish;
  int? disciplineForeignLanguageFrench;
  int? disciplineForeignLanguageOther;
  int? disciplineArts;
  int? disciplinePhysicalEducation;
  int? disciplineHistory;
  int? disciplineGeography;
  int? disciplinePhilosophy;
  int? disciplineSocialStudy;
  int? disciplineSociology;
  String? disciplinePortugueseSecondaryLanguage;
  String? disciplineCurricularStage;
  int? disciplineInformatics;
  int? disciplineProfessionalDisciplines;
  int? disciplineSpecialEducationAndInclusivePractices;
  int? disciplineSocioculturalDiversity;
  int? disciplineLibras;
  int? disciplinePedagogical;
  int? disciplineReligious;
  int? disciplineNativeLanguage;
  int? disciplineOthers;
  int? schoolYear;
  String? turn;
  DateTime? createDate;
  String? hash;
  String? calendarFk;
  String? schooling;
  String? diffLocation;
  String? course;
  int? vacancy;
}
