import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class ListStudentsUsecase
    implements Usecase<List<StudentIdentification>, ListStudentsParams> {
  ListStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Failure, List<StudentIdentification>>> call(
    ListStudentsParams params,
  ) async {
    final result = await _repositoryStudent.listAll(schoolId: params.schoolId);

    return result;
  }
}

class ListStudentsParams {
  final String schoolId;

  ListStudentsParams(this.schoolId);
}
