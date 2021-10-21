import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/teacher_repository.dart';
import 'package:dartz/dartz.dart';

class ListTeachersUsecase implements Usecase<List<Teacher>, NoParams> {
  ListTeachersUsecase(this._repositoryTeacher);

  final TeacherRepository _repositoryTeacher;

  @override
  Future<Either<Exception, List<Teacher>>> call(NoParams params) async {
    final result = await _repositoryTeacher.listAll();
    return result;
  }
}
