import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

abstract class StudentRepository {
  Future<Either<Exception, List<Student>>> listAll({required String schoolId});
  Future<Either<Exception, Student>> getById(
    String id, {
    required String schoolId,
  });
  Future<Either<Exception, Student>> create(Student student);
  Future<Either<Exception, Student>> update(int id, Student student);
  Future<Either<Exception, bool>> delete(String id);
}
