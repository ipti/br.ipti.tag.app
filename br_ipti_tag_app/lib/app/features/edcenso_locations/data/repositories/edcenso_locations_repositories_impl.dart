import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/datasources/edcenso_locations_local_datasource.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_uf.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';
import 'package:dartz/dartz.dart';

class EdcensoLocationsRepositoryImpl extends EdcensoLocationsRepository {
  final EdcensoLocationsRemoteDatasource _remoteDatasource;

  final EdcensoLocationsLocalDatasource _localDatasource;

  EdcensoLocationsRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Exception, List<EdCensoCity>>> listCities([
    String? edCensoUfId,
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
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, List<EdCensoUF>>> listUfs() async {
    try {
      final results = await _remoteDatasource.listUFs();

      results.sort(
        (a, b) => a.name.compareTo(b.name),
      );

      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }
}
