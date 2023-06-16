import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class CreateClassroomUsecase extends Usecase<bool, ClassroomCreateEntity> {
  CreateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Failure, bool>> call(
    ClassroomCreateEntity params,
  ) async {
    return _repositoryClassroom.create(params);
  }
}
