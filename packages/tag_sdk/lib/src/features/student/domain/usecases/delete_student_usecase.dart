import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class DeleteStudentsUsecase implements Usecase<bool, DeleteStudentParams> {
  DeleteStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Failure, bool>> call(DeleteStudentParams params) async {
    final result = await _repositoryStudent.delete(params.id);

    return result;
  }
}

class DeleteStudentParams {
  const DeleteStudentParams({
    required this.id,
  });

  final String id;
}
