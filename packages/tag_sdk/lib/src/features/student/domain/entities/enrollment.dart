class StudentEnrollment {
  int? id;
  int? oldId;
  String? registerType;
  String schoolInepIdFk;
  String? studentInepId;
  int studentFk;
  String? classroomInepId;
  int classroomFk;
  int? enrollmentId;
  int? unifiedClass;
  int? edcensoStageVsModalityFk;
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
    this.id,
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

  // ignore: long-method
  StudentEnrollment copyWith({
    int? id,
    int? oldId,
    String? registerType,
    String? schoolInepIdFk,
    String? studentInepId,
    int? studentFk,
    String? classroomInepId,
    int? classroomFk,
    int? enrollmentId,
    int? unifiedClass,
    int? edcensoStageVsModalityFk,
    int? anotherScholarizationPlace,
    int? multi,
    bool? aeeCognitiveFunctions,
    bool? aeeAutonomousLife,
    bool? aeeCurriculumEnrichment,
    bool? aeeAccessibleTeaching,
    bool? aeeLibras,
    bool? aeePortuguese,
    bool? aeeSoroban,
    bool? aeeBraille,
    bool? aeeMobilityTechniques,
    bool? aeeCaa,
    bool? aeeOpticalNonoptical,
    bool? publicTransport,
    int? transportResponsableGovernment,
    bool? vehicleTypeVan,
    bool? vehicleTypeMicrobus,
    bool? vehicleTypeBus,
    bool? vehicleTypeBike,
    bool? vehicleTypeAnimalVehicle,
    bool? vehicleTypeOtherVehicle,
    bool? vehicleTypeWaterwayBoat5,
    bool? vehicleTypeWaterwayBoat515,
    bool? vehicleTypeWaterwayBoat1535,
    bool? vehicleTypeWaterwayBoat35,
    bool? vehicleTypeMetroOrTrain,
    int? studentEntryForm,
    int? hash,
    String? schoolAdmissionDate,
    int? currentStageSituation,
    int? previousStageSituation,
    int? admissionType,
    int? hashClassroom,
    int? hashStudent,
    int? status,
  }) {
    return StudentEnrollment(
      id: id ?? this.id,
      oldId: oldId ?? this.oldId,
      registerType: registerType ?? this.registerType,
      schoolInepIdFk: schoolInepIdFk ?? this.schoolInepIdFk,
      studentInepId: studentInepId ?? this.studentInepId,
      studentFk: studentFk ?? this.studentFk,
      classroomInepId: classroomInepId ?? this.classroomInepId,
      classroomFk: classroomFk ?? this.classroomFk,
      enrollmentId: enrollmentId ?? this.enrollmentId,
      unifiedClass: unifiedClass ?? this.unifiedClass,
      edcensoStageVsModalityFk:
          edcensoStageVsModalityFk ?? this.edcensoStageVsModalityFk,
      anotherScholarizationPlace:
          anotherScholarizationPlace ?? this.anotherScholarizationPlace,
      multi: multi ?? this.multi,
      aeeCognitiveFunctions:
          aeeCognitiveFunctions ?? this.aeeCognitiveFunctions,
      aeeAutonomousLife: aeeAutonomousLife ?? this.aeeAutonomousLife,
      aeeCurriculumEnrichment:
          aeeCurriculumEnrichment ?? this.aeeCurriculumEnrichment,
      aeeAccessibleTeaching:
          aeeAccessibleTeaching ?? this.aeeAccessibleTeaching,
      aeeLibras: aeeLibras ?? this.aeeLibras,
      aeePortuguese: aeePortuguese ?? this.aeePortuguese,
      aeeSoroban: aeeSoroban ?? this.aeeSoroban,
      aeeBraille: aeeBraille ?? this.aeeBraille,
      aeeMobilityTechniques:
          aeeMobilityTechniques ?? this.aeeMobilityTechniques,
      aeeCaa: aeeCaa ?? this.aeeCaa,
      aeeOpticalNonoptical: aeeOpticalNonoptical ?? this.aeeOpticalNonoptical,
      publicTransport: publicTransport ?? this.publicTransport,
      transportResponsableGovernment:
          transportResponsableGovernment ?? this.transportResponsableGovernment,
      vehicleTypeVan: vehicleTypeVan ?? this.vehicleTypeVan,
      vehicleTypeMicrobus: vehicleTypeMicrobus ?? this.vehicleTypeMicrobus,
      vehicleTypeBus: vehicleTypeBus ?? this.vehicleTypeBus,
      vehicleTypeBike: vehicleTypeBike ?? this.vehicleTypeBike,
      vehicleTypeAnimalVehicle:
          vehicleTypeAnimalVehicle ?? this.vehicleTypeAnimalVehicle,
      vehicleTypeOtherVehicle:
          vehicleTypeOtherVehicle ?? this.vehicleTypeOtherVehicle,
      vehicleTypeWaterwayBoat5:
          vehicleTypeWaterwayBoat5 ?? this.vehicleTypeWaterwayBoat5,
      vehicleTypeWaterwayBoat515:
          vehicleTypeWaterwayBoat515 ?? this.vehicleTypeWaterwayBoat515,
      vehicleTypeWaterwayBoat1535:
          vehicleTypeWaterwayBoat1535 ?? this.vehicleTypeWaterwayBoat1535,
      vehicleTypeWaterwayBoat35:
          vehicleTypeWaterwayBoat35 ?? this.vehicleTypeWaterwayBoat35,
      vehicleTypeMetroOrTrain:
          vehicleTypeMetroOrTrain ?? this.vehicleTypeMetroOrTrain,
      studentEntryForm: studentEntryForm ?? this.studentEntryForm,
      hash: hash ?? this.hash,
      schoolAdmissionDate: schoolAdmissionDate ?? this.schoolAdmissionDate,
      currentStageSituation:
          currentStageSituation ?? this.currentStageSituation,
      previousStageSituation:
          previousStageSituation ?? this.previousStageSituation,
      admissionType: admissionType ?? this.admissionType,
      hashClassroom: hashClassroom ?? this.hashClassroom,
      hashStudent: hashStudent ?? this.hashStudent,
      status: status ?? this.status,
    );
  }
}
