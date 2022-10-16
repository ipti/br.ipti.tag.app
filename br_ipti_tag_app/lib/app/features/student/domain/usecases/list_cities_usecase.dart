import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';

class ListStudentsUsecase implements Usecase<List<Student>, NoParams> {
  ListStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, List<Student>>> call(NoParams params) async {
    final result = await _repositoryStudent.listAll(schoolId: "");

    return result;
  }
}
