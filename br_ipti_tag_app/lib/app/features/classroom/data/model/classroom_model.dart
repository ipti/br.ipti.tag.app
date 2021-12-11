import 'package:br_ipti_tag_app/app/api/classroom/post_classroom_endpoint.dart';

class ClassroomModel {
  const ClassroomModel({
    this.disciplineForeignLanguageEnglish = false,
    this.edcensoStageVsModalityFk = '',
    this.initialHour = '',
    this.initialMinute = '',
    this.finalHour = '',
    this.finalMinute = '',
    this.weekDaySunday = false,
    this.weekDayMonday = false,
    this.weekDayTuesday = false,
    this.weekDayWednesday = false,
    this.weekDayThursday = false,
    this.weekDayFriday = false,
    this.weekDaySaturday = false,
    this.edcensoProfessionalEducationCourseFk,
    this.registerType = '',
    this.inepId = '',
    this.name = '',
    this.schoolFk,
    this.course = 0,
    this.pedagogicalMeditationType = 0,
    this.schooling = false,
    this.complementaryActivity = false,
    this.aee = false,
    this.assistanceType = 0,
    this.maisEducacaoParticipator = false,
    this.complementaryActivityType1 = 0,
    this.complementaryActivityType2 = 0,
    this.complementaryActivityType3 = 0,
    this.complementaryActivityType4 = 0,
    this.complementaryActivityType5 = 0,
    this.complementaryActivityType6 = 0,
    this.diffLocation = 0,
    this.aeeBraille = false,
    this.aeeOpticalNonoptical = false,
    this.aeeCognitiveFunction = false,
    this.aeeMobilityTechniques = false,
    this.aeeLibras = false,
    this.aeeCaa = false,
    this.aeeCurriculumEnrichment = false,
    this.aeeSoroban = false,
    this.aeeAccessibleTeaching = false,
    this.aeePortuguese = false,
    this.aeeAutonomousLife = false,
    this.modality = 0,
    this.disciplineChemistry = false,
    this.disciplinePhysics = false,
    this.disciplineMathematics = false,
    this.disciplineBiology = false,
    this.disciplineScience = false,
    this.disciplineLanguagePortugueseLiterature = false,
    this.disciplineForeignLanguageSpanish = false,
    this.disciplineForeignLanguageFranch = false,
    this.disciplineForeignLanguageOther = false,
    this.disciplineArts = false,
    this.disciplinePhysicalEducation = false,
    this.disciplineHistory = false,
    this.disciplineGeography = false,
    this.disciplinePhilosophy = false,
    this.disciplineSocialStudy = false,
    this.disciplineSociology = false,
    this.disciplinePortugueseSecondaryLanguage = false,
    this.disciplineCurricularStage = false,
    this.disciplineInformatics = false,
    this.disciplineProfessionalDisciplines = false,
    this.disciplineSpecialEducationAndInclusivePractives = false,
    this.disciplineSocioculturalDiversity = false,
    this.disciplineLibras = false,
    this.disciplinePedagogical = false,
    this.disciplineReligious = false,
    this.disciplineNativeLanguage = false,
    this.disciplineOthers = false,
    this.schoolYear = 0,
    this.turn = '',
    this.hash = 0,
    this.calendarFk,
  });
  final String registerType;
  final String inepId;
  final SchoolFk? schoolFk;
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
  final EdcensoFk? edcensoProfessionalEducationCourseFk;
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
  final CalendarFk? calendarFk;
}
