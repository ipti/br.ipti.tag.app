import 'package:br_ipti_tag_app/app/features/school/data/datasources/school_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/repositories/school_repositories.dart';
import 'package:dartz/dartz.dart';

class SchoolRepositoryImpl extends SchoolRepository {
  final SchoolRemoteDataSource _schoolDataSource;

  SchoolRepositoryImpl(this._schoolDataSource);

  @override
  Future<Either<Exception, SchoolEntity>> create(SchoolEntity school) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> delete(String uuid) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<SchoolEntity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, SchoolEntity>> getById(String uuid) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, SchoolEntity>> update(
      String uuid, SchoolEntity school) async {
    try {
      final results = await _schoolDataSource.update(uuid, school);
      return Right(results as SchoolEntity);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}
