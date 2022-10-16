import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:dartz/dartz.dart';

class LoadStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, LoadStudentEnrollmentParams> {
  LoadStudentEnrollmentUsecase(this._studentEnrollmentRepository);

  final StudentEnrollmentRepository _studentEnrollmentRepository;

  @override
  Future<Either<Exception, StudentEnrollment>> call(
    LoadStudentEnrollmentParams params,
  ) async {
    final result = await _studentEnrollmentRepository.getStudentById(
      params.studentId,
    );

    return result;
  }
}

class LoadStudentEnrollmentParams {
  final int studentId;
  final String schoolId;

  LoadStudentEnrollmentParams(this.studentId, this.schoolId);
}
