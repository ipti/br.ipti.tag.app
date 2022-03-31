import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:dartz/dartz.dart';

class UpdateStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, UpdateStudentEnrollmentParams> {
  UpdateStudentEnrollmentUsecase(this._repositoryStudent);

  final StudentEnrollmentRepository _repositoryStudent;

  @override
  Future<Either<Exception, StudentEnrollment>> call(
    UpdateStudentEnrollmentParams params,
  ) async {
    final result = await _repositoryStudent.update(
      params.enrollmentId,
      params.enrollment,
    );

    return result;
  }
}

class UpdateStudentEnrollmentParams {
  final String enrollmentId;
  final StudentEnrollment enrollment;

  UpdateStudentEnrollmentParams({
    required this.enrollmentId,
    required this.enrollment,
  });
}
