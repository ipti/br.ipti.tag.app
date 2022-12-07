import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_enrollment_repositories.dart';

class CreateStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, CreateStudentEnrollmentParams> {
  CreateStudentEnrollmentUsecase(this._repositoryStudent);

  final StudentEnrollmentRepository _repositoryStudent;

  @override
  Future<Either<Failure, StudentEnrollment>> call(
    CreateStudentEnrollmentParams params,
  ) async {
    final result = await _repositoryStudent.create(params.enrollment);

    return result;
  }
}

class CreateStudentEnrollmentParams {
  final StudentEnrollment enrollment;

  CreateStudentEnrollmentParams({
    required this.enrollment,
  });
}
