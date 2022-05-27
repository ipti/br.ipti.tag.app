import 'package:br_ipti_tag_app/app/features/school/data/datasources/school_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/repositories/school_repositories.dart';
import 'package:dartz/dartz.dart';

class SchoolRepositoryImpl extends SchoolRepository {
  SchoolRepositoryImpl(this._schoolRemoteDataSource);

  final SchoolRemoteDataSource _schoolRemoteDataSource;

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
  Future<Either<Exception, SchoolEntity>> getById(String uuid) async {
    try {
      final result = await _schoolRemoteDataSource.getOne(uuid);
      return Right(result as SchoolEntity);
    } catch (e) {
      return Left(Exception("Não foi possível encontrar os dados da escola"));
    }
  }

  @override
  Future<Either<Exception, SchoolEntity>> update(
      String uuid, SchoolEntity school) async {
    try {
      print("object4");
      final results = await _schoolRemoteDataSource.update(uuid, school);
      return Right(results as SchoolEntity);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}
