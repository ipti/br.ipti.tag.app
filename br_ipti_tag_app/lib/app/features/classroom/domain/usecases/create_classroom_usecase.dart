import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class CreateClassroomUsecase extends Usecase<bool, ClassroomCreateEntity> {
  CreateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(
    ClassroomCreateEntity classroomCreate,
  ) async {
    return _repositoryClassroom.create(classroomCreate);
  }
}
