import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyAuthUsecase implements Usecase<AuthToken, NoParams> {
  VerifyAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, AuthToken>> call(NoParams params) async {
    final result = await _repository.getCachedAuthToken();
    return result;
  }
}
