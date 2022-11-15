import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

abstract class SchoolRepository {
  Future<Either<Exception, SchoolModel>> create(School school);
  Future<Either<Exception, List<SchoolModel>>> getAll();
  Future<Either<Exception, SchoolModel>> getById(String uuid);
  Future<Either<Exception, SchoolModel>> update(
    String uuid,
    School school,
  );
  Future<Either<Exception, bool>> delete(String uuid);
}
