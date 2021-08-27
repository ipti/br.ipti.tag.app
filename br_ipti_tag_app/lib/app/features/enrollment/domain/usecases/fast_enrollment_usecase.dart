import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';

import '../../domain/entities/student.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EnroolmentParams extends Equatable {
  final Student student;

  EnroolmentParams(this.student);
  @override
  List<Object> get props => [student];
}

class FastEnrollmentUsecase implements Usecase<bool, EnroolmentParams> {
  final IStudentService _service;

  FastEnrollmentUsecase(this._service);

  @override
  Future<Either<Exception, bool>> call(EnroolmentParams params) async {
    return await _service.create(params.student);
  }
}

abstract class IStudentService {
  Future<Either<Exception, bool>> create(Student student);
  Future<Either<Exception, Student>> getById(int id);
  Future<Either<Exception, List<Student>>> listAll();
}
