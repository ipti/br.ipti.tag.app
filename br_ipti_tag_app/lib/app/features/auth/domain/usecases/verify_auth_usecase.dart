import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyAuthUsecase implements Usecase<String, NoParams> {
  VerifyAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, String>> call(NoParams params) async {
    final result = await _repository.getAccessToken();
    if (result.isRight()) {
      await _repository.fetchUserData();
    } else {
      _repository.logout();
    }

    return result;
  }
}
