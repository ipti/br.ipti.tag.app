import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/classroom_repositories.dart';
import 'package:dartz/dartz.dart';

class ListClassroomsUsecase
    implements Usecase<List<Classroom>, ClassroomParams> {
  ListClassroomsUsecase(
    this._repositoryStudent,
  );

  final ClassroomRepository _repositoryStudent;

  @override
  Future<Either<Exception, List<Classroom>>> call(
    ClassroomParams params,
  ) async {
    final result = await _repositoryStudent.listAll(params);
    return result;
  }
}
