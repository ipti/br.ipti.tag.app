import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

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
