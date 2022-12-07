import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class UpdateStudentUsecase
    implements Usecase<StudentIdentification, UpdateStudentParams> {
  UpdateStudentUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Failure, StudentIdentification>> call(
      UpdateStudentParams params) async {
    final StudentIdentification student = params.student;

    final result = await _repositoryStudent.update(params.id, student);

    return result;
  }
}

class UpdateStudentParams {
  const UpdateStudentParams({
    required this.id,
    required this.student,
  });

  final StudentIdentification student;
  final int id;
}
