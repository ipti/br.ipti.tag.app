import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ListCitiesUsecase extends Usecase<List<EdCensoCity>, FilterUFParams> {
  final EdcensoLocationsRepository _repository;

  ListCitiesUsecase(this._repository);

  @override
  Future<Either<Exception, List<EdCensoCity>>> call(FilterUFParams params) {
    return _repository.listCities(params.uf);
  }
}

class FilterUFParams extends Equatable {
  const FilterUFParams({
    this.uf,
  });

  final String? uf;

  @override
  List<Object> get props => [uf ?? ""];
}
