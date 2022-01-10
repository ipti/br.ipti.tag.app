import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepository {
  Future<Either<Exception, List<Student>>> listAll();
  Future<Either<Exception, Student>> getById(int id);
  Future<Either<Exception, Student>> create(Student student);
  Future<Either<Exception, Student>> update(String id, Student student);
}
