import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ListClassroomsUsecase
    implements Usecase<List<ClassroomEntity>, ClassroomParams> {
  ListClassroomsUsecase(this._repositoryClassroom);

  final ClassroomRepository _repositoryClassroom;

  @override
  Future<Either<Exception, List<ClassroomEntity>>> call(
      ClassroomParams params) async {
    final result = await _repositoryClassroom.list(params);
    return result;
  }
}

class ClassroomParams {
  final String perPage;
  final String page;
  ClassroomParams({this.perPage = '100', this.page = '1'});

  Map<String, dynamic> toJson() => <String, dynamic>{
        "page": page,
        "perPage": perPage,
      };
}
