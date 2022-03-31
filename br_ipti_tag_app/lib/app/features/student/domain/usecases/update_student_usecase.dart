import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateStudentUsecase implements Usecase<Student, UpdateStudentParams> {
  UpdateStudentUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, Student>> call(UpdateStudentParams params) async {
    final Student student = params.student;

    final result = await _repositoryStudent.update(params.id, student);
    return result;
  }
}

class UpdateStudentParams extends Equatable {
  const UpdateStudentParams({
    required this.id,
    required this.student,
  });

  final Student student;
  final String id;

  @override
  List<Object> get props => [id, student.hashCode];
}
