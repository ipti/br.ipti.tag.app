import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_enrollment_repositories.dart';

class UpdateStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, UpdateStudentEnrollmentParams> {
  UpdateStudentEnrollmentUsecase(this._repositoryStudent);

  final StudentEnrollmentRepository _repositoryStudent;

  @override
  Future<Either<Failure, StudentEnrollment>> call(
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
  final int enrollmentId;
  final StudentEnrollment enrollment;

  UpdateStudentEnrollmentParams({
    required this.enrollmentId,
    required this.enrollment,
  });
}
