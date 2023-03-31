import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

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
