import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_uf.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';

class ListUFsUsecase extends Usecase<List<EdCensoUF>, EmptyParams> {
  final EdcensoLocationsRepository _repository;

  ListUFsUsecase(this._repository);

  @override
  Future<Either<Exception, List<EdCensoUF>>> call(EmptyParams params) {
    return _repository.listUfs();
  }
}
