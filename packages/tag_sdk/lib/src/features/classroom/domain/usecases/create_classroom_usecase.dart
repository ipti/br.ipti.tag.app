import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class CreateClassroomUsecase extends Usecase<bool, ClassroomCreateEntity> {
  CreateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(
    ClassroomCreateEntity params,
  ) async {
    return _repositoryClassroom.create(params);
  }
}
