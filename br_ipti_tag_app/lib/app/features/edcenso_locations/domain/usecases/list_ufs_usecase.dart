import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/entities/edcenso_uf.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';
import 'package:dartz/dartz.dart';

class ListUFsUsecase extends Usecase<List<EdCensoUF>, NoParams> {
  final EdcensoLocationsRepository _repository;

  ListUFsUsecase(this._repository);

  @override
  Future<Either<Exception, List<EdCensoUF>>> call(NoParams params) {
    return _repository.listUfs();
  }
}
