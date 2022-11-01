import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class DeleteClassroomUsecase extends Usecase<bool, String> {
  DeleteClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(
    String params,
  ) async {
    return _repositoryClassroom.delete(
      id: params,
    );
  }
}
