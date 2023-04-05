import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListClassroomsUsecase
    implements Usecase<List<ClassroomEntity>, ClassroomParams> {
  ListClassroomsUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Failure, List<ClassroomEntity>>> call(ClassroomParams params) async {
    final result = await _repositoryClassroom.listAll(params);

    return result;
  }
}
