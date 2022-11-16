import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> listAll({required String schoolId});
  Future<Either<Failure, Student>> getById(
    String id, {
    required String schoolId,
  });
  Future<Either<Failure, Student>> create(Student student);
  Future<Either<Failure, Student>> update(int id, Student student);
  Future<Either<Failure, bool>> delete(String id);
}
