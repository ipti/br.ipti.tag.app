import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:equatable/equatable.dart';

class EnrollmentClassroomState extends Equatable {
  const EnrollmentClassroomState({
    this.schoolAdmissionDate,
    this.unifiedClass,
    this.stage,
    this.edcensoStageVsModalityFk,
    this.studentEntryForm,
    this.status,
    this.anotherScholarizationPlace,
    this.previousStageSituation,
    this.currentStageSituation,
    required this.classroomId,
  });

  final String classroomId;
  final String? schoolAdmissionDate;
  final int? unifiedClass;
  final Stage? stage;
  final String? edcensoStageVsModalityFk;
  final int? studentEntryForm;
  final int? status;
  final int? anotherScholarizationPlace;
  final int? previousStageSituation;
  final int? currentStageSituation;

  @override
  List<Object?> get props => [classroomId];

  EnrollmentClassroomState copyWith({
    String? classroomId,
    String? schoolAdmissionDate,
    int? unifiedClass,
    Stage? stage,
    String? edcensoStageVsModalityFk,
    int? studentEntryForm,
    int? status,
    int? anotherScholarizationPlace,
    int? previousStageSituation,
    int? currentStageSituation,
  }) {
    return EnrollmentClassroomState(
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
}

class EmptyEnrollmentClassroomState extends EnrollmentClassroomState {
  const EmptyEnrollmentClassroomState() : super(classroomId: "");
}
