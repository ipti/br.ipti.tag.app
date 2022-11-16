import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';

class ListCitiesUsecase extends Usecase<List<EdCensoCity>, FilterUFParams> {
  final EdcensoLocationsRepository _repository;

  ListCitiesUsecase(this._repository);

  @override
  Future<Either<Failure, List<EdCensoCity>>> call(FilterUFParams params) {
    return _repository.listCities(params.uf);
  }
}

class FilterUFParams {
  const FilterUFParams({
    this.uf,
  });

  final int? uf;
}
