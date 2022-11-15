import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';

abstract class InstructorRepository {
  Future<Either<Exception, List<Instructor>>> listAll();
  Future<Either<Exception, Instructor>> getById(String id);
  Future<Either<Exception, Instructor>> create(Instructor instructor);
  Future<Either<Exception, Instructor>> update(
    String id,
    Instructor instructor,
  );
}
