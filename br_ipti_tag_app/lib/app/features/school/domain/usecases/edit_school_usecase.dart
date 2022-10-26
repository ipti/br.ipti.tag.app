import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/repositories/school_repositories.dart';
import 'package:dartz/dartz.dart';

class EditSchoolUsecase implements Usecase<SchoolEntity, EditSchoolParams> {
  EditSchoolUsecase(this._repository);
  final SchoolRepository _repository;

  @override
  Future<Either<Exception, SchoolModel>> call(EditSchoolParams params) async {
    final result = await _repository.update(params.uuid, params.data);

    return result;
  }
}

class EditSchoolParams {
  String uuid;
  SchoolEntity data;
  EditSchoolParams({
    required this.uuid,
    required this.data,
  });
}
