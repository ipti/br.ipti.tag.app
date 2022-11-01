import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';

class UpdateAuthUsecase implements Usecase<User, EmptyParams> {
  UpdateAuthUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Exception, User>> call(EmptyParams params) async {
    final result = await _repository.fetchUserData();

    return result;
  }
}
