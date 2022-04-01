import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_create_model.dart';
import 'package:flutter/material.dart';

class ClassroomCreateEntity {
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int modalityId;
  final int typePedagogicMediationId;
  final bool weekDaysSunday;
  final bool weekDaysMonday;
  final bool weekDaysTuesday;
  final bool weekDaysWednesday;
  final bool weekDaysThursday;
  final bool weekDaysFriday;
  final bool weekDaysSaturday;
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
  final String schoolId;

  ClassroomCreateEntity({
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
    this.weekDaysSunday = true,
    this.weekDaysMonday = true,
    this.weekDaysTuesday = true,
    this.weekDaysWednesday = true,
    this.weekDaysThursday = true,
    this.weekDaysFriday = false,
    this.weekDaysSaturday = false,
    this.moreEducationParticipator = false,
    required this.edcensoStageVsModalityFk,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.typePedagogicMediationId,
    required this.schoolId,
  });

  ClassroomCreateModel fromEntity() {
    return ClassroomCreateModel(
      startTime: startTime,
      endTime: endTime,
      edcensoStageVsModalityFk: edcensoStageVsModalityFk,
      modality: modalityId,
      name: name,
      typePedagogicMediationId: typePedagogicMediationId,
      weekDayFriday: weekDaysFriday,
      weekDayMonday: weekDaysMonday,
      weekDaySaturday: weekDaysSaturday,
      weekDaySunday: weekDaysSunday,
      weekDayThursday: weekDaysThursday,
      weekDayTuesday: weekDaysTuesday,
      weekDayWednesday: weekDaysWednesday,
      schooling: schooling,
      complementaryActivity: complementaryActivity,
      aee: aee,
      aeeAccessibleTeaching: aeeAccessibleTeaching,
      aeeAutonomousLife: aeeAutonomousLife,
      aeeBraille: aeeBraille,
      aeeCaa: aeeCaa,
      aeeCognitiveFunction: aeeCognitiveFunctions,
      aeeCurriculumEnrichment: aeeCurriculumEnrichment,
      aeeLibras: aeeLibras,
      aeeMobilityTechniques: aeeMobilityTechniques,
      aeeOpticalNonoptical: aeeOpticalNonOptical,
      aeePortuguese: aeePortuguese,
      aeeSoroban: aeeSoroban,
      moreEducationParticipator: moreEducationParticipator,
      schoolId: schoolId,
    );
  }
}
