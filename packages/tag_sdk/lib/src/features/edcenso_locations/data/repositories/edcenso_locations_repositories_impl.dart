import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/datasources/edcenso_locations_local_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_uf.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';

class EdcensoLocationsRepositoryImpl extends EdcensoLocationsRepository {
  final EdcensoLocationsRemoteDatasource _remoteDatasource;

  final EdcensoLocationsLocalDatasource _localDatasource;

  EdcensoLocationsRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, List<EdCensoCity>>> listCities([
    int? edCensoUfId,
  ]) async {
    try {
      final results = await _localDatasource.listCities(edCensoUfId);

      if (results.isNotEmpty) return Right(results);

      final remoteResults = await _remoteDatasource.listCities();
      _localDatasource.storeCities(remoteResults);

      final filteredResults = remoteResults
          .where((element) => element.edcensoUfId == edCensoUfId)
          .toList();

      filteredResults.sort(
        (a, b) => a.name.compareTo(b.name),
      );

      return Right(filteredResults);
    } catch (e) {
      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }

  @override
  Future<Either<Failure, List<EdCensoUF>>> listUfs() async {
    try {
      final results = await _remoteDatasource.listUFs();

      results.sort(
        (a, b) => a.name.compareTo(b.name),
      );

      return Right(results);
    } catch (e) {
      return Left(
        Failure("Não foi possível listar"),
      );
    }
  }
}
