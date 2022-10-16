import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteStudentsUsecase implements Usecase<bool, DeleteStudentParams> {
  DeleteStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, bool>> call(DeleteStudentParams params) async {
    final result = await _repositoryStudent.delete(params.id);

    return result;
  }
}

class DeleteStudentParams extends Equatable {
  const DeleteStudentParams({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
