import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_uf.dart';

abstract class EdcensoLocationsRepository {
  Future<Either<Exception, List<EdCensoCity>>> listCities([
    int? edCensoUfId,
  ]);
  Future<Either<Exception, List<EdCensoUF>>> listUfs();
}
