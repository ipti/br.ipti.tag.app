import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class CreateClassroomUsecase extends Usecase<bool, Classroom> {
  final ClassroomRepository _repositoryClassroom;

  CreateClassroomUsecase(this._repositoryClassroom);

  @override
  Future<Either<Exception, bool>> call(Classroom classroom) async {
    return _repositoryClassroom.create(classroom);
  }
}
