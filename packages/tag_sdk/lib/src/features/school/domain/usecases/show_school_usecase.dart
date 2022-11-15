import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/repositories/school_repositories.dart';

class ShowSchoolUsecase implements Usecase<SchoolModel, ShowSchoolParams> {
  ShowSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Exception, SchoolModel>> call(ShowSchoolParams params) async {
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
