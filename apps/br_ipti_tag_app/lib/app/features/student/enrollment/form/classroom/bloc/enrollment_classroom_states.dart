import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class EnrollmentClassroomState extends Equatable {
  const EnrollmentClassroomState({
    this.Classroom,
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
  final StudentEnrollment? Classroom;
  final int? classroomId;
  final String? schoolAdmissionDate;
  final UnifiedClass? unifiedClass;
  final Stage? stage;
  final int? edcensoStageVsModalityFk;
  final AdmissionType? studentEntryForm;
  final int? status;
  final int? anotherScholarizationPlace;
  final PreviousStageSituation? previousStageSituation;
  final CurrentStageSituation? currentStageSituation;

  EnrollmentClassroomState copyWith({
    StudentEnrollment? Classroom,
    List<ClassroomEntity>? classrooms,
    int? classroomId,
    String? schoolAdmissionDate,
    UnifiedClass? unifiedClass,
    Stage? stage,
    int? edcensoStageVsModalityFk,
    AdmissionType? studentEntryForm,
    int? status,
    int? anotherScholarizationPlace,
    PreviousStageSituation? previousStageSituation,
    CurrentStageSituation? currentStageSituation,
  }) {
    return EnrollmentClassroomState(
      Classroom: Classroom ?? this.Classroom,
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
      Classroom.hashCode,
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
