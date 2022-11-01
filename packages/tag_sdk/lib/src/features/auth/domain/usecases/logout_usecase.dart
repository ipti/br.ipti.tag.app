import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase implements Usecase<void, EmptyParams> {
  LogoutUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, void>> call(EmptyParams params) async {
    final result = await _repository.logout();

    return result;
  }
}
