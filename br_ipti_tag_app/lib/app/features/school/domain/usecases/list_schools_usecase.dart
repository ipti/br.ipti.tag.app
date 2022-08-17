import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/repositories/school_repositories.dart';
import 'package:dartz/dartz.dart';

class ListSchoolsUsecase implements Usecase<List<SchoolEntity>, NoParams> {
  ListSchoolsUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Exception, List<SchoolEntity>>> call(NoParams params) async {
    final result = await _repository.getAll();
    return result;
  }
}
