import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';

abstract class InstructorRepository {
  Future<Either<Failure, List<Instructor>>> listAll();
  Future<Either<Failure, Instructor>> getById(int id);
  Future<Either<Failure, Instructor>> create(Instructor instructor);
  Future<Either<Failure, Instructor>> update(
    int id,
    Instructor instructor,
  );
}
