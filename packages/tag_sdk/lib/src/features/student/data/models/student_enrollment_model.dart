import 'dart:convert';

import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';

class StudentEnrollmentModel extends StudentEnrollment {
  StudentEnrollmentModel({
    super.id,
    super.oldId,
    super.registerType,
    required super.schoolInepIdFk,
    super.studentInepId,
    required super.studentFk,
    super.classroomInepId,
    required super.classroomFk,
    super.enrollmentId,
    super.unifiedClass,
    super.edcensoStageVsModalityFk,
    super.anotherScholarizationPlace,
    super.multi,
    super.aeeCognitiveFunctions,
    super.aeeAutonomousLife,
    super.aeeCurriculumEnrichment,
    super.aeeAccessibleTeaching,
    super.aeeLibras,
    super.aeePortuguese,
    super.aeeSoroban,
    super.aeeBraille,
    super.aeeMobilityTechniques,
    super.aeeCaa,
    super.aeeOpticalNonoptical,
    super.publicTransport,
    super.transportResponsableGovernment,
    super.vehicleTypeVan,
    super.vehicleTypeMicrobus,
    super.vehicleTypeBus,
    super.vehicleTypeBike,
    super.vehicleTypeAnimalVehicle,
    super.vehicleTypeOtherVehicle,
    super.vehicleTypeWaterwayBoat5,
    super.vehicleTypeWaterwayBoat515,
    super.vehicleTypeWaterwayBoat1535,
    super.vehicleTypeWaterwayBoat35,
    super.vehicleTypeMetroOrTrain,
    super.studentEntryForm,
    super.hash,
    super.schoolAdmissionDate,
    super.currentStageSituation,
    super.previousStageSituation,
    super.admissionType,
    super.hashClassroom,
    super.hashStudent,
    super.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'old_id': oldId,
      'register_type': registerType,
      'school_inep_id_fk': schoolInepIdFk,
      'student_inep_id': studentInepId,
      'student_fk': studentFk,
      'classroom_inep_id': classroomInepId,
      'classroom_fk': classroomFk,
      'enrollment_id': enrollmentId,
      'unified_class': unifiedClass,
      'edcenso_stage_vs_modality_fk': edcensoStageVsModalityFk,
      'another_scholarization_place': anotherScholarizationPlace,
      'multi': multi,
      'aee_cognitive_functions': aeeCognitiveFunctions,
      'aee_autonomous_life': aeeAutonomousLife,
      'aee_curriculum_enrichment': aeeCurriculumEnrichment,
      'aee_accessible_teaching': aeeAccessibleTeaching,
      'aee_libras': aeeLibras,
      'aee_portuguese': aeePortuguese,
      'aee_soroban': aeeSoroban,
      'aee_braille': aeeBraille,
      'aee_mobility_techniques': aeeMobilityTechniques,
      'aee_caa': aeeCaa,
      'aee_optical_nonoptical': aeeOpticalNonoptical,
      'public_transport': publicTransport,
      'transport_responsable_government': transportResponsableGovernment,
      'vehicle_type_van': vehicleTypeVan,
      'vehicle_type_microbus': vehicleTypeMicrobus,
      'vehicle_type_bus': vehicleTypeBus,
      'vehicle_type_bike': vehicleTypeBike,
      'vehicle_type_animal_vehicle': vehicleTypeAnimalVehicle,
      'vehicle_type_other_vehicle': vehicleTypeOtherVehicle,
      'vehicle_type_waterway_boat5': vehicleTypeWaterwayBoat5,
      'vehicle_type_waterway_boat515': vehicleTypeWaterwayBoat515,
      'vehicle_type_waterway_boat1535': vehicleTypeWaterwayBoat1535,
      'vehicle_type_waterway_boat35': vehicleTypeWaterwayBoat35,
      'vehicle_type_metro_or_train': vehicleTypeMetroOrTrain,
      'student_entry_form': studentEntryForm,
      'hash': hash,
      'school_admission_date': schoolAdmissionDate,
      'current_stage_situation': currentStageSituation,
      'previous_stage_situation': previousStageSituation,
      'admission_type': admissionType,
      'hash_classroom': hashClassroom,
      'hash_student': hashStudent,
      'status': status,
    };
  }

  factory StudentEnrollmentModel.fromEntity(StudentEnrollment entity) {
    return StudentEnrollmentModel(
      id: entity.id,
      oldId: entity.oldId,
      registerType: entity.registerType,
      schoolInepIdFk: entity.schoolInepIdFk,
      studentInepId: entity.studentInepId,
      studentFk: entity.studentFk,
      classroomInepId: entity.classroomInepId,
      classroomFk: entity.classroomFk,
      enrollmentId: entity.enrollmentId,
      unifiedClass: entity.unifiedClass,
      edcensoStageVsModalityFk: entity.edcensoStageVsModalityFk,
      anotherScholarizationPlace: entity.anotherScholarizationPlace,
      multi: entity.multi,
      aeeCognitiveFunctions: entity.aeeCognitiveFunctions,
      aeeAutonomousLife: entity.aeeAutonomousLife,
      aeeCurriculumEnrichment: entity.aeeCurriculumEnrichment,
      aeeAccessibleTeaching: entity.aeeAccessibleTeaching,
      aeeLibras: entity.aeeLibras,
      aeePortuguese: entity.aeePortuguese,
      aeeSoroban: entity.aeeSoroban,
      aeeBraille: entity.aeeBraille,
      aeeMobilityTechniques: entity.aeeMobilityTechniques,
      aeeCaa: entity.aeeCaa,
      aeeOpticalNonoptical: entity.aeeOpticalNonoptical,
      publicTransport: entity.publicTransport,
      transportResponsableGovernment: entity.transportResponsableGovernment,
      vehicleTypeVan: entity.vehicleTypeVan,
      vehicleTypeMicrobus: entity.vehicleTypeMicrobus,
      vehicleTypeBus: entity.vehicleTypeBus,
      vehicleTypeBike: entity.vehicleTypeBike,
      vehicleTypeAnimalVehicle: entity.vehicleTypeAnimalVehicle,
      vehicleTypeOtherVehicle: entity.vehicleTypeOtherVehicle,
      vehicleTypeWaterwayBoat5: entity.vehicleTypeWaterwayBoat5,
      vehicleTypeWaterwayBoat515: entity.vehicleTypeWaterwayBoat515,
      vehicleTypeWaterwayBoat1535: entity.vehicleTypeWaterwayBoat1535,
      vehicleTypeWaterwayBoat35: entity.vehicleTypeWaterwayBoat35,
      vehicleTypeMetroOrTrain: entity.vehicleTypeMetroOrTrain,
      studentEntryForm: entity.studentEntryForm,
      hash: entity.hash,
      schoolAdmissionDate: entity.schoolAdmissionDate,
      currentStageSituation: entity.currentStageSituation,
      previousStageSituation: entity.previousStageSituation,
      admissionType: entity.admissionType,
      hashClassroom: entity.hashClassroom,
      hashStudent: entity.hashStudent,
      status: entity.status,
    );
  }

  factory StudentEnrollmentModel.fromMap(Map<String, dynamic> map) {
    return StudentEnrollmentModel(
      id: map['_id'],
      oldId: map['old_id'],
      registerType: map['register_type'] ?? '',
      schoolInepIdFk: map['school_inep_id_fk'] ?? '',
      studentInepId: map['student_inep_id'],
      studentFk: map['student_fk'] ?? '',
      classroomInepId: map['classroom_inep_id'],
      classroomFk: map['classroom_fk'] ?? '',
      enrollmentId: map['enrollment_id'],
      unifiedClass: map['unified_class'],
      edcensoStageVsModalityFk: map['edcenso_stage_vs_modality_fk'],
      anotherScholarizationPlace: map['another_scholarization_place'],
      multi: map['multi'],
      aeeCognitiveFunctions: map['aee_cognitive_functions'],
      aeeAutonomousLife: map['aee_autonomous_life'],
      aeeCurriculumEnrichment: map['aee_curriculum_enrichment'],
      aeeAccessibleTeaching: map['aee_accessible_teaching'],
      aeeLibras: map['aee_libras'],
      aeePortuguese: map['aee_portuguese'],
      aeeSoroban: map['aee_soroban'],
      aeeBraille: map['aee_braille'],
      aeeMobilityTechniques: map['aee_mobility_techniques'],
      aeeCaa: map['aee_caa'],
      aeeOpticalNonoptical: map['aee_optical_nonoptical'],
      publicTransport: map['public_transport'],
      transportResponsableGovernment: map['transport_responsable_government'],
      vehicleTypeVan: map['vehicle_type_van'],
      vehicleTypeMicrobus: map['vehicle_type_microbus'],
      vehicleTypeBus: map['vehicle_type_bus'],
      vehicleTypeBike: map['vehicle_type_bike'],
      vehicleTypeAnimalVehicle: map['vehicle_type_animal_vehicle'],
      vehicleTypeOtherVehicle: map['vehicle_type_other_vehicle'],
      vehicleTypeWaterwayBoat5: map['vehicle_type_waterway_boat5'],
      vehicleTypeWaterwayBoat515: map['vehicle_type_waterway_boat515'],
      vehicleTypeWaterwayBoat1535: map['vehicle_type_waterway_boat1535'],
      vehicleTypeWaterwayBoat35: map['vehicle_type_waterway_boat35'],
      vehicleTypeMetroOrTrain: map['vehicle_type_metro_or_train'],
      studentEntryForm: map['student_entry_form'],
      hash: map['hash'],
      schoolAdmissionDate: map['school_admission_date'],
      currentStageSituation: map['current_stage_situation'],
      previousStageSituation: map['previous_stage_situation'],
      admissionType: map['admission_type'],
      hashClassroom: map['hash_classroom'],
      hashStudent: map['hash_student'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory StudentEnrollmentModel.fromJson(String source) =>
      StudentEnrollmentModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return '''StudentEnrollment(id: $id, oldId: $oldId, registerType: $registerType, schoolInepIdFk: $schoolInepIdFk, studentInepId: $studentInepId, studentFk: $studentFk, classroomInepId: $classroomInepId, classroomFk: $classroomFk, enrollmentId: $enrollmentId, unifiedClass: $unifiedClass, edcensoStageVsModalityFk: $edcensoStageVsModalityFk, anotherScholarizationPlace: $anotherScholarizationPlace, multi: $multi, aeeCognitiveFunctions: $aeeCognitiveFunctions, aeeAutonomousLife: $aeeAutonomousLife, aeeCurriculumEnrichment: $aeeCurriculumEnrichment, aeeAccessibleTeaching: $aeeAccessibleTeaching, aeeLibras: $aeeLibras, aeePortuguese: $aeePortuguese, aeeSoroban: $aeeSoroban, aeeBraille: $aeeBraille, aeeMobilityTechniques: $aeeMobilityTechniques, aeeCaa: $aeeCaa, aeeOpticalNonoptical: $aeeOpticalNonoptical, publicTransport: $publicTransport, transportResponsableGovernment: $transportResponsableGovernment, vehicleTypeVan: $vehicleTypeVan, vehicleTypeMicrobus: $vehicleTypeMicrobus, vehicleTypeBus: $vehicleTypeBus, vehicleTypeBike: $vehicleTypeBike, vehicleTypeAnimalVehicle: $vehicleTypeAnimalVehicle, vehicleTypeOtherVehicle: $vehicleTypeOtherVehicle, vehicleTypeWaterwayBoat5: $vehicleTypeWaterwayBoat5, vehicleTypeWaterwayBoat515: $vehicleTypeWaterwayBoat515, vehicleTypeWaterwayBoat1535: $vehicleTypeWaterwayBoat1535, vehicleTypeWaterwayBoat35: $vehicleTypeWaterwayBoat35, vehicleTypeMetroOrTrain: $vehicleTypeMetroOrTrain, studentEntryForm: $studentEntryForm, hash: $hash, schoolAdmissionDate: $schoolAdmissionDate, currentStageSituation: $currentStageSituation, previousStageSituation: $previousStageSituation, admissionType: $admissionType, hashClassroom: $hashClassroom, hashStudent: $hashStudent, status: $status)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentEnrollment &&
        other.id == id &&
        other.oldId == oldId &&
        other.registerType == registerType &&
        other.schoolInepIdFk == schoolInepIdFk &&
        other.studentInepId == studentInepId &&
        other.studentFk == studentFk &&
        other.classroomInepId == classroomInepId &&
        other.classroomFk == classroomFk &&
        other.enrollmentId == enrollmentId &&
        other.unifiedClass == unifiedClass &&
        other.edcensoStageVsModalityFk == edcensoStageVsModalityFk &&
        other.anotherScholarizationPlace == anotherScholarizationPlace &&
        other.multi == multi &&
        other.aeeCognitiveFunctions == aeeCognitiveFunctions &&
        other.aeeAutonomousLife == aeeAutonomousLife &&
        other.aeeCurriculumEnrichment == aeeCurriculumEnrichment &&
        other.aeeAccessibleTeaching == aeeAccessibleTeaching &&
        other.aeeLibras == aeeLibras &&
        other.aeePortuguese == aeePortuguese &&
        other.aeeSoroban == aeeSoroban &&
        other.aeeBraille == aeeBraille &&
        other.aeeMobilityTechniques == aeeMobilityTechniques &&
        other.aeeCaa == aeeCaa &&
        other.aeeOpticalNonoptical == aeeOpticalNonoptical &&
        other.publicTransport == publicTransport &&
        other.transportResponsableGovernment ==
            transportResponsableGovernment &&
        other.vehicleTypeVan == vehicleTypeVan &&
        other.vehicleTypeMicrobus == vehicleTypeMicrobus &&
        other.vehicleTypeBus == vehicleTypeBus &&
        other.vehicleTypeBike == vehicleTypeBike &&
        other.vehicleTypeAnimalVehicle == vehicleTypeAnimalVehicle &&
        other.vehicleTypeOtherVehicle == vehicleTypeOtherVehicle &&
        other.vehicleTypeWaterwayBoat5 == vehicleTypeWaterwayBoat5 &&
        other.vehicleTypeWaterwayBoat515 == vehicleTypeWaterwayBoat515 &&
        other.vehicleTypeWaterwayBoat1535 == vehicleTypeWaterwayBoat1535 &&
        other.vehicleTypeWaterwayBoat35 == vehicleTypeWaterwayBoat35 &&
        other.vehicleTypeMetroOrTrain == vehicleTypeMetroOrTrain &&
        other.studentEntryForm == studentEntryForm &&
        other.hash == hash &&
        other.schoolAdmissionDate == schoolAdmissionDate &&
        other.currentStageSituation == currentStageSituation &&
        other.previousStageSituation == previousStageSituation &&
        other.admissionType == admissionType &&
        other.hashClassroom == hashClassroom &&
        other.hashStudent == hashStudent &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        oldId.hashCode ^
        registerType.hashCode ^
        schoolInepIdFk.hashCode ^
        studentInepId.hashCode ^
        studentFk.hashCode ^
        classroomInepId.hashCode ^
        classroomFk.hashCode ^
        enrollmentId.hashCode ^
        unifiedClass.hashCode ^
        edcensoStageVsModalityFk.hashCode ^
        anotherScholarizationPlace.hashCode ^
        multi.hashCode ^
        aeeCognitiveFunctions.hashCode ^
        aeeAutonomousLife.hashCode ^
        aeeCurriculumEnrichment.hashCode ^
        aeeAccessibleTeaching.hashCode ^
        aeeLibras.hashCode ^
        aeePortuguese.hashCode ^
        aeeSoroban.hashCode ^
        aeeBraille.hashCode ^
        aeeMobilityTechniques.hashCode ^
        aeeCaa.hashCode ^
        aeeOpticalNonoptical.hashCode ^
        publicTransport.hashCode ^
        transportResponsableGovernment.hashCode ^
        vehicleTypeVan.hashCode ^
        vehicleTypeMicrobus.hashCode ^
        vehicleTypeBus.hashCode ^
        vehicleTypeBike.hashCode ^
        vehicleTypeAnimalVehicle.hashCode ^
        vehicleTypeOtherVehicle.hashCode ^
        vehicleTypeWaterwayBoat5.hashCode ^
        vehicleTypeWaterwayBoat515.hashCode ^
        vehicleTypeWaterwayBoat1535.hashCode ^
        vehicleTypeWaterwayBoat35.hashCode ^
        vehicleTypeMetroOrTrain.hashCode ^
        studentEntryForm.hashCode ^
        hash.hashCode ^
        schoolAdmissionDate.hashCode ^
        currentStageSituation.hashCode ^
        previousStageSituation.hashCode ^
        admissionType.hashCode ^
        hashClassroom.hashCode ^
        hashStudent.hashCode ^
        status.hashCode;
  }
}
