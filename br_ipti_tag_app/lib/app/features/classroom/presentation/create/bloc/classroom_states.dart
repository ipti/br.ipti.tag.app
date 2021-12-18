import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClassroomCreateState extends Equatable {}

class ClassroomCreateFormState extends ClassroomCreateState {
  ClassroomCreateFormState({
    this.weekDaysSunday = false,
    this.weekDaysMonday = true,
    this.weekDaysTuesday = true,
    this.weekDaysWednesday = true,
    this.weekDaysThursday = true,
    this.weekDaysFriday = true,
    this.weekDaysSaturday = false,
    this.stageVsModalityFk = 'st',
    this.schoolYear,
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
    required this.registerType,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.stageId,
    required this.typePedagogicMediationId,
  });
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
  final String stageVsModalityFk;
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

  ClassroomCreateFormState copyWith({
    String? registerType,
    String? name,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? modalityId,
    int? stageId,
    int? typePedagogicMediationId,
    bool? weekDaysSunday,
    bool? weekDaysMonday,
    bool? weekDaysTuesday,
    bool? weekDaysWednesday,
    bool? weekDaysThursday,
    bool? weekDaysFriday,
    bool? weekDaysSaturday,
    String? stageVsModalityFk,
    int? schoolYear,
    bool? schooling,
    bool? complementaryActivity,
    bool? aee,
    bool? aeeBraille,
    bool? aeeOpticalNonOptical,
    bool? aeeCognitiveFunctions,
    bool? aeeMobilityTechniques,
    bool? aeeLibras,
    bool? aeeCaa,
    bool? aeeCurriculumEnrichment,
    bool? aeeAccessibleTeaching,
    bool? aeePortuguese,
    bool? aeeSoroban,
    bool? aeeAutonomousLife,
  }) {
    return ClassroomCreateFormState(
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      modalityId: modalityId ?? this.modalityId,
      stageId: stageId ?? this.stageId,
      typePedagogicMediationId:
          typePedagogicMediationId ?? this.typePedagogicMediationId,
      registerType: registerType ?? this.registerType,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      startTime,
      endTime,
      modalityId,
      stageId,
      typePedagogicMediationId,
      registerType,
      aee,
      aeeAccessibleTeaching,
      aeeAutonomousLife,
      aeeBraille,
      aeeCaa,
      aeeCognitiveFunctions,
      aeeCurriculumEnrichment,
      aeeLibras,
      aeeMobilityTechniques,
      aeeOpticalNonOptical,
      aeePortuguese,
      aeeSoroban,
      schooling,
      schoolYear,
      complementaryActivity,
      stageVsModalityFk,
      weekDaysFriday,
      weekDaysMonday,
      weekDaysSaturday,
      weekDaysSunday,
      weekDaysThursday,
      weekDaysTuesday,
      weekDaysWednesday
    ];
  }
}
