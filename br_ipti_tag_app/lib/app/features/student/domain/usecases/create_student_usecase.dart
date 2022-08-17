import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateStudentsUsecase implements Usecase<Student, CreateStudentParams> {
  CreateStudentsUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, Student>> call(CreateStudentParams params) async {
    final result = await _repositoryStudent.create(params.student);
    return result;
  }
}

class CreateStudentParams extends Equatable {
  const CreateStudentParams({
    required this.student,
  });

  final Student student;

  @override
  List<Object> get props => [student.name ?? ""];
}
