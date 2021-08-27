import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ListClassroomsUsecase implements Usecase<List<Classroom>, NoParams> {
  final ClassroomRepository _repositoryClassroom;

  ListClassroomsUsecase(this._repositoryClassroom);

  @override
  Future<Either<Exception, List<Classroom>>> call(NoParams params) async {
    await Future.delayed(Duration(seconds: 2));
    final result = await _repositoryClassroom.list();
    return result;
  }
}
