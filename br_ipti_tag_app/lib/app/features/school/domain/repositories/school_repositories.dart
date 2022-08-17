import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:dartz/dartz.dart';

abstract class SchoolRepository {
  Future<Either<Exception, SchoolModel>> create(SchoolEntity school);
  Future<Either<Exception, List<SchoolModel>>> getAll();
  Future<Either<Exception, SchoolModel>> getById(String uuid);
  Future<Either<Exception, SchoolModel>> update(
    String uuid,
    SchoolEntity school,
  );
  Future<Either<Exception, bool>> delete(String uuid);
}
