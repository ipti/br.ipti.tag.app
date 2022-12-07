import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/api/classroom/classroom.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';

class ListClassroomsUsecase
    implements Usecase<List<ClassroomEntity>, ClassroomParams> {
  ListClassroomsUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Failure, List<ClassroomEntity>>> call(
      ClassroomParams params) async {
    final result = await _repositoryClassroom.listAll(params);

    return result;
  }
}
