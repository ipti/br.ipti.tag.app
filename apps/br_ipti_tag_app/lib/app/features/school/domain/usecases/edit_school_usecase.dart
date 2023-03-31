import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class EditSchoolUsecase implements Usecase<School, EditSchoolParams> {
  EditSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Failure, School>> call(EditSchoolParams params) async {
    final result = await _repository.update(params.uuid, params.data);

    return result;
  }
}

class EditSchoolParams {
  String uuid;
  School data;
  EditSchoolParams({
    required this.uuid,
    required this.data,
  });
}
