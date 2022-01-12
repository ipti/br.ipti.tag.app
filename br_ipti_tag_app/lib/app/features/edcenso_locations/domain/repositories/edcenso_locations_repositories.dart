import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:dartz/dartz.dart';

abstract class EdcensoLocationsRepository {
  Future<Either<Exception, List<EdCensoCity>>> listCities();
}
