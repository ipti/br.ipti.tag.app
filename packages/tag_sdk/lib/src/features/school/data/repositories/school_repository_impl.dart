import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/school/data/datasources/school_remote_datasource.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';
import 'package:tag_sdk/src/features/school/domain/repositories/school_repositories.dart';

class SchoolRepositoryImpl extends SchoolRepository {
  SchoolRepositoryImpl(this._schoolRemoteDataSource);

  final SchoolRemoteDataSource _schoolRemoteDataSource;

  @override
  Future<Either<Exception, SchoolModel>> create(School school) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> delete(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<SchoolModel>>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, SchoolModel>> getById(String uuid) async {
    try {
      final result = await _schoolRemoteDataSource.getOne(uuid);

      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível encontrar os dados da escola"),
      );
    }
  }

  @override
  Future<Either<Exception, SchoolModel>> update(
    String uuid,
    School school,
  ) async {
    try {
      final results = await _schoolRemoteDataSource.update(uuid, school);

      return Right(results);
    } catch (e) {
      return Left(
        Exception("Não foi possível atualizar dados da escola"),
      );
    }
  }
}
