import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class CreateStudentsUsecase implements Usecase<Student, CreateStudentParams> {
  CreateStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Failure, Student>> call(CreateStudentParams params) async {
    final result = await _repositoryStudent.create(params.student);

    return result;
  }
}

class CreateStudentParams {
  const CreateStudentParams({
    required this.student,
  });

  final Student student;
}
