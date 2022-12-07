import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';
import 'package:tag_sdk/src/features/school/domain/repositories/school_repositories.dart';

class ListSchoolsUsecase implements Usecase<List<School>, EmptyParams> {
  ListSchoolsUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Failure, List<School>>> call(EmptyParams params) async {
    final result = await _repository.getAll();

    return result;
  }
}
