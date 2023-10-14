import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<StudentIdentification>>> listAll({required String schoolId});

  Future<Either<Failure, StudentIdentification>> getById(int id, { required String schoolId });

  Future<Either<Failure, StudentIdentification>> create(StudentIdentification student);

  Future<Either<Failure, StudentIdentification>> update(int id, StudentIdentification student);

  Future<Either<Failure, bool>> delete(int id);
}
