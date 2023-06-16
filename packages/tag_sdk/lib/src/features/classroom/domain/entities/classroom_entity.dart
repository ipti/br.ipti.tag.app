class ClassroomEntity {
  ClassroomEntity({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stage,
    required this.id,
    required this.edcensoStageVsModalityFk,
    this.typePedagogicMediationId,
    this.schooling = false,
    this.complementaryActivity = false,
    this.aee = false,
    this.aeeBraille = false,
    this.aeeOpticalNonOptical = false,
    this.aeeCognitiveFunctions = false,
    this.aeeMobilityTechniques = false,
    this.aeeLibras = false,
    this.aeeCaa = false,
    this.aeeCurriculumEnrichment = false,
    this.aeeAccessibleTeaching = false,
    this.aeePortuguese = false,
    this.aeeSoroban = false,
    this.aeeAutonomousLife = false,
    this.moreEducationParticipator = false,
  });

  final String name;
  final int id;
  final String startTime;
  final String endTime;
  final int? modalityId;
  final String stage;
  final int? typePedagogicMediationId;
  final String edcensoStageVsModalityFk;
  final bool schooling;
  final bool complementaryActivity;
  final bool aee;
  final bool aeeBraille;
  final bool aeeOpticalNonOptical;
  final bool aeeCognitiveFunctions;
  final bool aeeMobilityTechniques;
  final bool aeeLibras;
  final bool aeeCaa;
  final bool aeeCurriculumEnrichment;
  final bool aeeAccessibleTeaching;
  final bool aeePortuguese;
  final bool aeeSoroban;
  final bool aeeAutonomousLife;
  final bool moreEducationParticipator;
}
