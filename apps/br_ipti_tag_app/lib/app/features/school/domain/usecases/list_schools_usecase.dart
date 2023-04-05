import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ListSchoolsUsecase implements Usecase<List<School>, EmptyParams> {
  ListSchoolsUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Failure, List<School>>> call(EmptyParams params) async {
    final result = await _repository.getAll();

    return result;
  }
}
