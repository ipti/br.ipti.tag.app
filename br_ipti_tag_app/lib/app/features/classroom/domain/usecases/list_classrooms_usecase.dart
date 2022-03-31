import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ListClassroomsUsecase
    implements Usecase<List<ClassroomEntity>, NoParams> {
  ListClassroomsUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, List<ClassroomEntity>>> call(NoParams params) async {
    final result = await _repositoryClassroom.list();
    return result;
  }
}
