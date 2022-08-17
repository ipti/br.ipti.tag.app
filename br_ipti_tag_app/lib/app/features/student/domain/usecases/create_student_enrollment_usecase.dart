import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
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
