import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_enrollment_repositories.dart';

class LoadStudentEnrollmentUsecase
    implements Usecase<StudentEnrollment, LoadStudentEnrollmentParams> {
  LoadStudentEnrollmentUsecase(this._ClassroomRepository);

  final StudentEnrollmentRepository _ClassroomRepository;

  @override
  Future<Either<Failure, StudentEnrollment>> call(
    LoadStudentEnrollmentParams params,
  ) async {
    final result = await _ClassroomRepository.getStudentById(
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
