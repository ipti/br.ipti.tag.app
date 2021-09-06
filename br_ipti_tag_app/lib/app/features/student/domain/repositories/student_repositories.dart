import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepository {
  Future<Either<Exception, List<Student>>> listAll();
  Future<Either<Exception, Student>> getById(int id);
  Future<Either<Exception, bool>> create(Student student);
}
