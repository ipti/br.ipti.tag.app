import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';

class EnrollmentParams {
  const EnrollmentParams(this.student);

  final Student student;
}

class FastEnrollmentUsecase implements Usecase<Student, EnrollmentParams> {
  FastEnrollmentUsecase(this._service);

  final StudentRepository _service;

  @override
  Future<Either<Exception, Student>> call(EnrollmentParams params) async {
    return _service.create(params.student);
  }
}
