import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:equatable/equatable.dart';

class EnrollmentClassroomState extends Equatable {
  const EnrollmentClassroomState({
    this.studentEnrollment,
    this.classrooms = const [],
    this.schoolAdmissionDate,
    this.unifiedClass,
    this.stage,
    this.edcensoStageVsModalityFk,
    this.studentEntryForm,
    this.status,
    this.anotherScholarizationPlace,
    this.previousStageSituation,
    this.currentStageSituation,
    this.classroomId,
  });

  final List<ClassroomEntity> classrooms;
  final StudentEnrollment? studentEnrollment;
  final String? classroomId;
  final String? schoolAdmissionDate;
  final UnifiedClass? unifiedClass;
  final Stage? stage;
  final String? edcensoStageVsModalityFk;
  final AdmissionType? studentEntryForm;
  final int? status;
  final int? anotherScholarizationPlace;
  final PreviousStageSituation? previousStageSituation;
  final CurrentStageSituation? currentStageSituation;

  EnrollmentClassroomState copyWith({
    StudentEnrollment? studentEnrollment,
    List<ClassroomEntity>? classrooms,
    String? classroomId,
    String? schoolAdmissionDate,
    UnifiedClass? unifiedClass,
    Stage? stage,
    String? edcensoStageVsModalityFk,
    AdmissionType? studentEntryForm,
    int? status,
    int? anotherScholarizationPlace,
    PreviousStageSituation? previousStageSituation,
    CurrentStageSituation? currentStageSituation,
  }) {
    return EnrollmentClassroomState(
      studentEnrollment: studentEnrollment ?? this.studentEnrollment,
      classrooms: classrooms ?? this.classrooms,
      classroomId: classroomId ?? this.classroomId,
      schoolAdmissionDate: schoolAdmissionDate ?? this.schoolAdmissionDate,
      unifiedClass: unifiedClass ?? this.unifiedClass,
      stage: stage ?? this.stage,
      edcensoStageVsModalityFk:
          edcensoStageVsModalityFk ?? this.edcensoStageVsModalityFk,
      studentEntryForm: studentEntryForm ?? this.studentEntryForm,
      status: status ?? this.status,
      anotherScholarizationPlace:
          anotherScholarizationPlace ?? this.anotherScholarizationPlace,
      previousStageSituation:
          previousStageSituation ?? this.previousStageSituation,
      currentStageSituation:
          currentStageSituation ?? this.currentStageSituation,
    );
  }

  @override
  List<Object?> get props {
    return [
      studentEnrollment.hashCode,
      classrooms.hashCode,
      classroomId,
      schoolAdmissionDate,
      unifiedClass,
      stage,
      edcensoStageVsModalityFk,
      studentEntryForm,
      status,
      anotherScholarizationPlace,
      previousStageSituation,
      currentStageSituation,
    ];
  }
}

class EmptyEnrollmentClassroomState extends EnrollmentClassroomState {
  const EmptyEnrollmentClassroomState() : super();
}
