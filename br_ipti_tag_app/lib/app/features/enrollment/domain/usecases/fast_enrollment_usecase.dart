import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/student.dart';

class EnroolmentParams extends Equatable {
  const EnroolmentParams(this.student);

  final Student student;

  @override
  List<Object> get props => [student];
}

class FastEnrollmentUsecase implements Usecase<bool, EnroolmentParams> {
  FastEnrollmentUsecase(this._service);

  final IStudentService _service;

  @override
  Future<Either<Exception, bool>> call(EnroolmentParams params) async {
    return _service.create(params.student);
  }
}

abstract class IStudentService {
  Future<Either<Exception, bool>> create(Student student);
  Future<Either<Exception, Student>> getById(int id);
  Future<Either<Exception, List<Student>>> listAll();
}
