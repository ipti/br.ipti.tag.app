import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteClassroomUsecase extends Usecase<bool, String> {
  DeleteClassroomUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, bool>> call(
    String id,
  ) async {
    return _repositoryClassroom.delete(
      id: id,
    );
  }
}
