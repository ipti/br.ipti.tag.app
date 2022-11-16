import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';
import 'package:tag_sdk/src/features/school/domain/repositories/school_repositories.dart';

class EditSchoolUsecase implements Usecase<School, EditSchoolParams> {
  EditSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Failure, SchoolModel>> call(EditSchoolParams params) async {
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
