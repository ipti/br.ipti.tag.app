import 'package:br_ipti_tag_app/app/domain/data/entities/student.dart';
import 'package:dartz/dartz.dart';

class FastEnrollmentUsecase {
  final IStudentService _service;

  FastEnrollmentUsecase(this._service);

  Future<Either<Exception, bool>> call(Student student) async {
    return await _service.create(student);
  }
}

abstract class IStudentService {
  Future<Either<Exception, bool>> create(Student student);
  Future<Either<Exception, Student>> getById(int id);
  Future<Either<Exception, List<Student>>> listAll();
}
