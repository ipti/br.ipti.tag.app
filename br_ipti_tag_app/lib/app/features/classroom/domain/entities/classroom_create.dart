import 'package:flutter/material.dart';

class ClassroomCreate {
  final String registerType;
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int modalityId;
  final int stageId;
  final int typePedagogicMediationId;
  final bool weekDaysSunday;
  final bool weekDaysMonday;
  final bool weekDaysTuesday;
  final bool weekDaysWednesday;
  final bool weekDaysThursday;
  final bool weekDaysFriday;
  final bool weekDaysSaturday;
  final String? stageVsModalityFk;
  final int? schoolYear;
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

  ClassroomCreate({
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
    this.stageVsModalityFk,
    this.weekDaysSunday = true,
    this.weekDaysMonday = true,
    this.weekDaysTuesday = true,
    this.weekDaysWednesday = true,
    this.weekDaysThursday = true,
    this.weekDaysFriday = true,
    this.weekDaysSaturday = true,
    this.schoolYear,
    required this.registerType,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stageId,
    required this.typePedagogicMediationId,
  });
}
