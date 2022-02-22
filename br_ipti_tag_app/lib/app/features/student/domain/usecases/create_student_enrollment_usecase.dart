import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/admission_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/current_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/previous_stage_situation_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/stage_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/unified_class_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:dartz/dartz.dart';

class CreateStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, CreateStudentEnrollmentParams> {
  CreateStudentEnrollmentUsecase(this._repositoryStudent);

  final StudentEnrollmentRepository _repositoryStudent;

  @override
  Future<Either<Exception, StudentEnrollment>> call(
    CreateStudentEnrollmentParams params,
  ) async {
    final enrollment = StudentEnrollment(
      schoolInepIdFk: params.schoolId,
      studentFk: params.studentId,
      classroomFk: params.classroomId,
      currentStageSituation: params.currentStageSituation?.id,
      previousStageSituation: params.previousStageSituation?.id,
      schoolAdmissionDate: params.schoolAdmissionDate,
      studentEntryForm: params.studentEntryForm?.id,
      unifiedClass: params.unifiedClass?.id,
      registerType: "rg",
    );

    final result = await _repositoryStudent.create(enrollment);
    return result;
  }
}

class CreateStudentEnrollmentParams {
  final String classroomId;
  final String studentId;
  final String schoolId;
  final String? schoolAdmissionDate;
  final UnifiedClass? unifiedClass;
  final Stage? stage;
  final String? edcensoStageVsModalityFk;
  final AdmissionType? studentEntryForm;
  final int? status;
  final int? anotherScholarizationPlace;
  final PreviousStageSituation? previousStageSituation;
  final CurrentStageSituation? currentStageSituation;

  CreateStudentEnrollmentParams({
    required this.schoolId,
    required this.classroomId,
    required this.studentId,
    this.schoolAdmissionDate,
    this.unifiedClass,
    this.stage,
    this.edcensoStageVsModalityFk,
    this.studentEntryForm,
    this.status,
    this.anotherScholarizationPlace,
    this.previousStageSituation,
    this.currentStageSituation,
  });
}
