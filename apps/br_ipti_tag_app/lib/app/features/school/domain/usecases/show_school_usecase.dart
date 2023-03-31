import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ShowSchoolUsecase implements Usecase<School, ShowSchoolParams> {
  ShowSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Failure, School>> call(ShowSchoolParams params) async {
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
