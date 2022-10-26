import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/repositories/edcenso_disciplines_repositories.dart';
import 'package:dartz/dartz.dart';

class ListEdcensoDisciplineUsecase
    extends Usecase<List<EdcensoDiscipline>, NoParams> {
  final EdcensoDisciplinesRepository _repository;

  ListEdcensoDisciplineUsecase(this._repository);

  @override
  Future<Either<Exception, List<EdcensoDiscipline>>> call(NoParams params) {
    return _repository.listAll();
  }
}
