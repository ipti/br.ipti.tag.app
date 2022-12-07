import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_uf.dart';

abstract class EdcensoLocationsRepository {
  Future<Either<Failure, List<EdCensoCity>>> listCities([
    int? edCensoUfId,
  ]);
  Future<Either<Failure, List<EdCensoUF>>> listUfs();
}
