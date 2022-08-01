import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:dartz/dartz.dart';

abstract class InstructorRepository {
  Future<Either<Exception, List<Instructor>>> listAll();
  Future<Either<Exception, Instructor>> getById(String id);
  Future<Either<Exception, Instructor>> create(Instructor instructor);
  Future<Either<Exception, Instructor>> update(
    String id,
    Instructor instructor,
  );
}
