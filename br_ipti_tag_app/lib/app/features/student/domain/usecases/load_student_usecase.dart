import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';

class LoadStudentUsecase implements Usecase<Student, LoadStudentParams> {
  LoadStudentUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, Student>> call(LoadStudentParams params) async {
    final result = await _repositoryStudent.getById(
      params.studentId,
      schoolId: params.schoolId,
    );

    return result;
  }
}

class LoadStudentParams {
  final String studentId;
  final String schoolId;

  LoadStudentParams(this.studentId, this.schoolId);
}
