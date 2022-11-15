import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/datasources/edcenso_locations_local_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/repositories/edcenso_disciplines_repositories.dart';

class EdcensoDisciplinesRepositoryImpl extends EdcensoDisciplinesRepository {
  final EdcensoDisciplinesRemoteDatasource _remoteDatasource;

  final EdcensoDisciplinesLocalDatasource _localDatasource;

  EdcensoDisciplinesRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
  );

  @override
  Future<Either<Exception, List<EdcensoDiscipline>>> listAll([
    String? edCensoUfId,
  ]) async {
    try {
      final results = await _localDatasource.listAll(edCensoUfId);

      if (results.isNotEmpty) return Right(results);

      final remoteResults = await _remoteDatasource.listAll();
      _localDatasource.storeDisciplines(remoteResults);

      final filteredResults = remoteResults.toList();

      filteredResults.sort(
        (a, b) => a.name.compareTo(b.name),
      );

      return Right(filteredResults);
    } catch (e) {
      log(e.toString());

      return Left(
        Exception("Não foi possível listar"),
      );
    }
  }
}
