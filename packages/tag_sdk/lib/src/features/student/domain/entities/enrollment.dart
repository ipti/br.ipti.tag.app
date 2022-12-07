import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment.freezed.dart';
part 'enrollment.g.dart';

@freezed
class StudentEnrollment with _$StudentEnrollment {
  const factory StudentEnrollment({
    int? id,
    @Default("00") String registerType,
    required String schoolIdentification,
    String? studentInepId,
    required int studentFk,
    String? classroomInepId,
    required int classroom,
    String? enrollmentId,
    int? unifiedClass,
    int? edcensoStageVsModality,
    int? multi,
    int? anotherScholarizationPlace,
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
    String? createDate,
    int? hash,
    String? schoolAdmissionDate,
    int? currentStageSituation,
    int? previousStageSituation,
    int? admissionType,
    int? hashClassroom,
    int? hashStudent,
    bool? status,
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
  }) = _StudentEnrollment;

  factory StudentEnrollment.fromJson(Map<String, Object?> json) =>
      _$StudentEnrollmentFromJson(json);
}
