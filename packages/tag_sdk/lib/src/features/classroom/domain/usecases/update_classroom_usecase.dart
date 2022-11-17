import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class UpdateClassroomUsecase extends Usecase<bool, UpdateClassroomParams> {
  UpdateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Failure, bool>> call(
    UpdateClassroomParams params,
  ) async {
    return _repositoryClassroom.update(
      id: params.id,
      classroomCreateEntity: params.classroomCreateEntity,
    );
  }
}

class UpdateClassroomParams {
  final int id;
  final ClassroomCreateEntity classroomCreateEntity;

  UpdateClassroomParams(this.id, this.classroomCreateEntity);
}
