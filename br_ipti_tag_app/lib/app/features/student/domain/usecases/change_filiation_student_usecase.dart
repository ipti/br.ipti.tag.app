import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/filiation.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/responsable.dart';
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

    student.responsable = params.responsable;
    student.filiation1 = params.filiation1;
    student.filiation2 = params.filiation2;

    final result = await _repositoryStudent.update(student.id!, student);
    return result;
  }
}

class ChangeFiliationStudentParams extends Equatable {
  const ChangeFiliationStudentParams({
    required this.student,
    required this.responsable,
    required this.filiation1,
    this.filiation2,
  });

  final Student student;
  final StudentResponsable responsable;
  final StudentFiliation filiation1;
  final StudentFiliation? filiation2;

  @override
  List<Object> get props => [student, responsable, filiation1];
}
