import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class CreateClassroomUsecase extends Usecase<bool, ClassroomCreate> {
  CreateClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(ClassroomCreate classroomCreate) async {
    return _repositoryClassroom.create(classroomCreate);
  }
}

