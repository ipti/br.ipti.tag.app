import 'package:dartz/dartz.dart';
import 'package:tag_sdk/tag_sdk.dart';
// import 'package:tag_sdk/src/core/defaults/params.dart';

class VerifyAuthUsecase implements Usecase<String, EmptyParams> {
  VerifyAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, String>> call(EmptyParams params) async {
    final result = await _repository.getAccessToken();
    if (result.isRight()) {
      await _repository.fetchUserData();
    } else {
      await _repository.logout();
    }

    return result;
  }
}
