import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

abstract class SchoolRepository {
  Future<Either<Failure, SchoolModel>> create(School school);
  Future<Either<Failure, List<SchoolModel>>> getAll();
  Future<Either<Failure, SchoolModel>> getById(String uuid);
  Future<Either<Failure, SchoolModel>> update(
    String uuid,
    School school,
  );
  Future<Either<Failure, bool>> delete(String uuid);
}
