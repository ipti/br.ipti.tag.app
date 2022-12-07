import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

abstract class SchoolRepository {
  Future<Either<Failure, School>> create(School school);
  Future<Either<Failure, List<School>>> getAll();
  Future<Either<Failure, School>> getById(String uuid);
  Future<Either<Failure, School>> update(
    String uuid,
    School school,
  );
  Future<Either<Failure, bool>> delete(String uuid);
}
