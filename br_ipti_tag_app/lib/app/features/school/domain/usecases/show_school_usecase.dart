import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/repositories/school_repositories.dart';
import 'package:dartz/dartz.dart';

class ShowSchoolUsecase implements Usecase<SchoolEntity, ShowSchoolParams> {
  ShowSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Exception, SchoolEntity>> call(params) async {
    final result = await _repository.getById(params.uuid);
    return result;
  }
}

class ShowSchoolParams {
  String uuid;
  ShowSchoolParams({
    required this.uuid,
  });
}
