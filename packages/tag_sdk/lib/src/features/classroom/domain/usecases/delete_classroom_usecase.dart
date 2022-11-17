import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class DeleteClassroomUsecase extends Usecase<bool, int> {
  DeleteClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Failure, bool>> call(
    int params,
  ) async {
    return _repositoryClassroom.delete(
      id: params,
    );
  }
}
