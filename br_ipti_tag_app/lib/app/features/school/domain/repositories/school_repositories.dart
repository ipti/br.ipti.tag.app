import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:dartz/dartz.dart';

abstract class SchoolRepository {
  Future<Either<Exception, SchoolEntity>> create(SchoolEntity school);
  Future<Either<Exception, List<SchoolEntity>>> getAll();
  Future<Either<Exception, SchoolEntity>> getById(String uuid);
  Future<Either<Exception, SchoolEntity>> update(
    String uuid,
    SchoolEntity school,
  );
  Future<Either<Exception, bool>> delete(String uuid);
}
