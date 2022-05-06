import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateClassroomUsecase extends Usecase<bool, Params> {
  UpdateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(
    Params params,
  ) async {
    return _repositoryClassroom.update(
      id: params.id,
      classroomCreateEntity: params.classroomCreateEntity,
    );
  }
}

class Params {
  final String id;
  final ClassroomCreateEntity classroomCreateEntity;

  Params(this.id, this.classroomCreateEntity);
}
