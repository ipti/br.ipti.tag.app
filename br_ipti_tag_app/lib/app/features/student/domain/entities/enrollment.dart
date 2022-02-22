class StudentEnrollment {
  int? oldId;
  String? registerType;
  String schoolInepIdFk;
  String? studentInepId;
  String studentFk;
  String? classroomInepId;
  String classroomFk;
  String? enrollmentId;
  int? unifiedClass;
  String? edcensoStageVsModalityFk;
  int? anotherScholarizationPlace;
  int? multi;
  bool? aeeCognitiveFunctions;
  bool? aeeAutonomousLife;
  bool? aeeCurriculumEnrichment;
  bool? aeeAccessibleTeaching;
  bool? aeeLibras;
  bool? aeePortuguese;
  bool? aeeSoroban;
  bool? aeeBraille;
  bool? aeeMobilityTechniques;
  bool? aeeCaa;
  bool? aeeOpticalNonoptical;
  bool? publicTransport;
  int? transportResponsableGovernment;
  bool? vehicleTypeVan;
  bool? vehicleTypeMicrobus;
  bool? vehicleTypeBus;
  bool? vehicleTypeBike;
  bool? vehicleTypeAnimalVehicle;
  bool? vehicleTypeOtherVehicle;
  bool? vehicleTypeWaterwayBoat5;
  bool? vehicleTypeWaterwayBoat515;
  bool? vehicleTypeWaterwayBoat1535;
  bool? vehicleTypeWaterwayBoat35;
  bool? vehicleTypeMetroOrTrain;
  int? studentEntryForm;
  int? hash;
  String? schoolAdmissionDate;
  int? currentStageSituation;
  int? previousStageSituation;
  int? admissionType;
  int? hashClassroom;
  int? hashStudent;
  int? status;

  StudentEnrollment({
    this.oldId,
    this.registerType,
    required this.schoolInepIdFk,
    this.studentInepId,
    required this.studentFk,
    this.classroomInepId,
    required this.classroomFk,
    this.enrollmentId,
    this.unifiedClass,
    this.edcensoStageVsModalityFk,
    this.anotherScholarizationPlace,
    this.multi,
    this.aeeCognitiveFunctions,
    this.aeeAutonomousLife,
    this.aeeCurriculumEnrichment,
    this.aeeAccessibleTeaching,
    this.aeeLibras,
    this.aeePortuguese,
    this.aeeSoroban,
    this.aeeBraille,
    this.aeeMobilityTechniques,
    this.aeeCaa,
    this.aeeOpticalNonoptical,
    this.publicTransport,
    this.transportResponsableGovernment,
    this.vehicleTypeVan,
    this.vehicleTypeMicrobus,
    this.vehicleTypeBus,
    this.vehicleTypeBike,
    this.vehicleTypeAnimalVehicle,
    this.vehicleTypeOtherVehicle,
    this.vehicleTypeWaterwayBoat5,
    this.vehicleTypeWaterwayBoat515,
    this.vehicleTypeWaterwayBoat1535,
    this.vehicleTypeWaterwayBoat35,
    this.vehicleTypeMetroOrTrain,
    this.studentEntryForm,
    this.hash,
    this.schoolAdmissionDate,
    this.currentStageSituation,
    this.previousStageSituation,
    this.admissionType,
    this.hashClassroom,
    this.hashStudent,
    this.status,
  });
}
