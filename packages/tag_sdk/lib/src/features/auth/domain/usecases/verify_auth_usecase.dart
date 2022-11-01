import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';

class VerifyAuthUsecase implements Usecase<String, EmptyParams> {
  VerifyAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, String>> call(EmptyParams params) async {
    final result = await _repository.getAccessToken();
    if (result.isRight()) {
      await _repository.fetchUserData();
    } else {
      _repository.logout();
    }

    return result;
  }
}
