import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/student.dart';

class EnrollmentParams extends Equatable {
  const EnrollmentParams(this.student);

  final Student student;

  @override
  List<Object> get props => [student];
}

class FastEnrollmentUsecase implements Usecase<Student, EnrollmentParams> {
  FastEnrollmentUsecase(this._service);

  final StudentRepository _service;

  @override
  Future<Either<Exception, Student>> call(EnrollmentParams params) async {
    return _service.create(params.student);
  }
}
