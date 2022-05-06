import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyAuthUsecase implements Usecase<List<School>, NoParams> {
  VerifyAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, List<School>>> call(NoParams params) async {
    final result = await _repository.getCurrentUserSchools();
    return result;
  }
}
