import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/repositories/edcenso_disciplines_repositories.dart';

class ListEdcensoDisciplineUsecase
    extends Usecase<List<EdcensoDiscipline>, EmptyParams> {
  final EdcensoDisciplinesRepository _repository;

  ListEdcensoDisciplineUsecase(this._repository);

  @override
  Future<Either<Failure, List<EdcensoDiscipline>>> call(EmptyParams params) {
    return _repository.listAll();
  }
}
