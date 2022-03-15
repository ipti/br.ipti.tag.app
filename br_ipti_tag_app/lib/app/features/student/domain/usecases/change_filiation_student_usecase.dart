import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ChangeFiliationStudentUsecase
    implements Usecase<Student, ChangeFiliationStudentParams> {
  ChangeFiliationStudentUsecase(this._repositoryStudent);

  final StudentRepository _repositoryStudent;

  @override
  Future<Either<Exception, Student>> call(
      ChangeFiliationStudentParams params) async {
    final Student student = params.student;

    if (student.id == null) {
      throw "ID do estudante não pode ser nulo";
    }

    final result = await _repositoryStudent.update(student.id!, student);
    return result;
  }
}

class ChangeFiliationStudentParams extends Equatable {
  const ChangeFiliationStudentParams({
    required this.student,
  });

  final Student student;

  @override
  List<Object> get props => [student.hashCode];
}
