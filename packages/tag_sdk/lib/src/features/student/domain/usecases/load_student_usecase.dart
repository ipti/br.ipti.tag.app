import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

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
